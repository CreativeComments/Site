<?php

/**
 * User
 *
 * @package		users
 * @subpackage	model
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class User
{
	/**
	 * The id of the user.
	 *
	 * @var	string
	 */
	public $id;

	/**
	 * Textual properties
	 *
	 * @var	string
	 */
	public $accessToken, $name, $email, $secret, $rawPassword, $password, $type, $facebookId;

	/**
	 * Boolean properties
	 */
	public $isAdmin = false;

	/**
	 * DateTime properties
	 *
	 * @var DateTime
	 */
	public $createdOn, $editedOn;

	/**
	 * Array properties
	 *
	 * @var	array
	 */
	private $settings = array();


	/**
	 * Get a user
	 *
	 * @param	int $id		The id of the user.
	 * @return User
	 */
	public static function get($id)
	{
		// redefine
		$id = (int) $id;

		// get data
		$data = Site::getDB()->getRecord('SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
											FROM users AS i
											WHERE i.id = ?',
											array($id));

		// validate
		if($data === null) return false;

		// create instance
		$item = new User();

		// initialize
		$item->initialize($data);

		// return
		return $item;
	}

	/**
	 * Get a user by his access_token
	 *
	 * @param $accessToken
	 * @return bool|User
	 */
	public static function getByAccessToken($accessToken)
	{
		// redefine
		$accessToken = (string) $accessToken;

		// get data
		$data = Site::getDB()->getRecord('SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
										  FROM users AS i
										  WHERE i.access_token = ?',
										 array($accessToken));

		// validate
		if($data === null) return false;

		// create instance
		$item = new User();

		// initialize
		$item->initialize($data);

		// return
		return $item;
	}


	/**
	 * Get a user by his email
	 *
	 * @param string $email
	 * @return User
	 */
	public static function getByEmail($email)
	{
		// redefine
		$email = (string) $email;

		// get data
		$data = Site::getDB()->getRecord('SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
										  FROM users AS i
										  WHERE i.email = ?',
										 array($email));

		// validate
		if($data === null) return false;

		// create instance
		$item = new User();

		// initialize
		$item->initialize($data);

		// return
		return $item;
	}

	/**
	 * Get a user by his Facebook id
	 *
	 * @param string $facebookId
	 * @return User
	 */
	public static function getByFacebookId($facebookId)
	{
		// redefine
		$facebookId = (string) $facebookId;

		// get data
		$data = Site::getDB()->getRecord('SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
										  FROM users AS i
										  WHERE i.facebook_id = ?',
										 array($facebookId));

		// validate
		if($data === null) return false;

		// create instance
		$item = new User();

		// initialize
		$item->initialize($data);

		// return
		return $item;
	}

	/**
	 * Get all users for usage in a dropdown
	 *
	 * @return array
	 */
	public static function getForDropdown()
	{
		return Site::getDB()->getPairs('SELECT i.id, i.name
										FROM users AS i
										ORDER BY i.name');
	}

	/**
	 * Get a setting
	 *
	 * @param	string $key		The key whereunder the value is stored.
	 * @return mixed
	 */
	public function getSetting($key)
	{
		if(!isset($this->settings[$key])) return null;
		else return $this->settings[$key];
	}

	/**
	 * Initialize the object.
	 *
	 * @param	array $data		The data in an array.
	 * @return User
	 */
	public function initialize($data)
	{
		if(isset($data['id'])) $this->id = (int) $data['id'];
		if(isset($data['access_token'])) $this->accessToken = (string) $data['access_token'];
		if(isset($data['facebook_id'])) $this->facebookId = (string) $data['facebook_id'];
		if(isset($data['name'])) $this->name = (string) $data['name'];
		if(isset($data['email'])) $this->email = (string) $data['email'];
		if(isset($data['password'])) $this->password = (string) $data['password'];
		if(isset($data['secret'])) $this->secret = (string) $data['secret'];
		if(isset($data['type'])) $this->type = (string) $data['type'];
		if(isset($data['data']))
		{
			$data['data'] = unserialize($data['data']);
			if(isset($data['data']['settings'])) $this->settings = $data['data']['settings'];
		}
		if($this->type == 'admin') $this->isAdmin = true;
		if(isset($data['created_on'])) $this->createdOn = new DateTime('@' . $data['created_on']);
		if(isset($data['edited_on'])) $this->editedOn = new DateTime('@' . $data['edited_on']);
	}

	/**
	 * Save the user
	 *
	 * @return bool
	 */
	public function save()
	{
		$this->editedOn = new DateTime();

		// build record
		$item['facebook_id'] = $this->facebookId;
		$item['name'] = $this->name;
		$item['email'] = $this->email;
		$item['secret'] = $this->secret;
		$item['type'] = $this->type;
		$item['data'] = serialize(array('settings' => $this->settings));
		$item['edited_on'] = Site::getUTCDate('Y-m-d H:i:s', $this->editedOn->getTimestamp());

		// new password?
		if($this->rawPassword != null) $item['password'] = sha1(md5($this->rawPassword) . $this->secret);

		// non existing
		if($this->id === null)
		{
			$this->createdOn = new DateTime();
			$item['created_on'] = Site::getUTCDate('Y-m-d H:i:s', $this->createdOn->getTimestamp());
			$this->id = Site::getDB(true)->insert('users', $item);
		}
		else Site::getDB(true)->update('users', $item, 'id = ?', $this->id);

		// return
		return true;
	}

	/**
	 * Store a setting
	 *
	 * @param	string $key		The key whereunder the value will be stored.
	 * @param	mixed $value	The value to store.
	 * @return void
	 */
	public function setSetting($key, $value)
	{
		$this->settings[(string) $key] = $value;
	}

	/**
	 * Return the object as an array
	 *
	 * @return array
	 */
	public function toArray()
	{
		// build array
		$item['id'] = $this->id;
		$item['accessToken'] = $this->accessToken;
		$item['facebookId'] = $this->facebookId;
		$item['name'] = $this->name;
		$item['email'] = $this->email;
		$item['type'] = $this->type;
		$item['isAdmin'] = $this->isAdmin;
		$item['createdOn'] = ($this->createdOn !== null) ? $this->createdOn->getTimestamp() : null;
		$item['editedOn'] = ($this->editedOn !== null) ? $this->editedOn->getTimestamp() : null;

		return $item;
	}
}
