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

			if($user === false)
			{
				// grab data from Facebook
				$data = Site::getFacebook()->api('/me');

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

			// login the user
			self::login($user);

			// recall
			self::getLoggedInUser();
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
		$data = $db->getRecord('SELECT u.id, u.name, u.email, u.secret, u.type, u.data
								FROM users_sessions AS i
								INNER JOIN users AS u ON i.user_id = u.id
								WHERE i.session_id = ? AND i.edited_on > ?',
								array(SpoonSession::getSessionId(), Site::getUTCDate(null, (time() - (2 * 60 * 60)))));

		// no data?
		if($data === null)
		{
			// check if the user is logged in through Facebook
			self::getFacebookUser();
		}

		// any data?
		if($data !== null)
		{
			// create instance
			$user = new User();

			// initialize
			$user->initialize($data);

			// return
			return $user;
		}
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
