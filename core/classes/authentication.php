<?php

/**
 * This class handles authentication
 *
 * @package		site
 * @subpackage	core
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class Authentication
{
	/**
	 * Get a user from Facebook, create a new one if needed
	 */
	private static function getFacebookUser()
	{
		$facebookId = Site::getFacebook()->getUser();

		// check if we know this user
		if($facebookId != 0)
		{
			$user = User::getByFacebookId($facebookId);

			try
			{
				// grab data from Facebook
				$data = Site::getFacebook()->api('/me');
			}
			catch(FacebookApiException $e)
			{
				// if no active token is found we should redirect to the homepage, and hope it is active in that time
				if(
					strtolower($e->getMessage()) == 'an active access token must be used to query information about the current user.' ||
					substr_count(strtolower($e->getMessage()), 'session has expired') > 0
				)
				{
					return false;
				}
				else throw $e;
			}

			if($user === false)
			{

				// create a new user
				$user = new User();
				$user->name = $data['name'];
				$user->email = $data['email'];
				$user->type = 'user';
				$user->secret = md5(uniqid());
				$user->rawPassword = md5(uniqid());
				$user->facebookId = $data['id'];

				// store the user
				$user->save();
			}

			else
			{
				// save changes if there are changes
				$changed = false;

				if($user->name != $data['name'])
				{
					$changed = true;
					$user->name = $data['name'];
				}
				if($user->email != $data['email'])
				{
					$changed = true;
					$user->email = $data['email'];
				}

				// store the user if needed
				if($changed) $user->save();
			}

			// login the user
			self::login($user);

			// recall
			self::getLoggedInUser();

			return $user;
		}
	}

	/**
	 * Get the logged in user.
	 *
	 * @return User
	 */
	public static function getLoggedInUser()
	{
		// get db
		$db = Site::getDB(true);

		// delete old sessions
		$db->delete('users_sessions', 'edited_on < ?', array(Site::getUTCDate(null, (time() - (2 * 60 * 60)))));

		// search for session
		$data = $db->getRecord('SELECT u.*, UNIX_TIMESTAMP(u.created_on) AS created_on, UNIX_TIMESTAMP(u.edited_on) AS edited_on
								FROM users_sessions AS i
								INNER JOIN users AS u ON i.user_id = u.id
								WHERE i.session_id = ? AND i.edited_on > ?',
								array(SpoonSession::getSessionId(), Site::getUTCDate(null, (time() - (2 * 60 * 60)))));

		// no data?
		if($data === null)
		{
			// check if the user is logged in through Facebook
			return self::getFacebookUser();
		}

		// any data?
		if($data !== null)
		{
			// create instance
			$user = new User();

			// initialize
			$user->initialize($data);

			// login again, so we stay logged in
			self::login($user);

			// return
			return $user;
		}
	}

	/**
	 * Login a given user
	 *
	 * @param User $user
	 */
	public static function login(User $user)
	{
		// build item
		$item['session_id'] = SpoonSession::getSessionId();
		$item['user_id'] = $user->id;
		$item['edited_on'] = Site::getUTCDate();

		// insert new session
		Site::getDB(true)->execute(
			'INSERT INTO users_sessions(session_id, user_id, edited_on)
			 VALUES(:session_id, :user_id, :edited_on)
			 ON DUPLICATE KEY UPDATE edited_on = :edited_on',
			$item
		);
	}

	/**
	 * Log out the user
	 *
	 * @return void
	 */
	public static function logout()
	{
		// delete session
		Site::getDB(true)->delete('users_sessions', 'session_id = ?', SpoonSession::getSessionId());

		// destroy
		SpoonSession::destroy();
		session_regenerate_id(true);
	}
}
