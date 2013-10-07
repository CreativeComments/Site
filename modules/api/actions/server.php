<?php

/**
 * ApiServer
 *
 * @package		api
 * @subpackage	server
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ApiServer extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$method = SpoonFilter::getGetValue('method', null, '');
		if($method == '') $method = SpoonFilter::getPostValue('method', null, '');
		if($method == '') $this->outputError('unknown method');

		// build method name
		$chunks = explode('.', $method);
		if(count($chunks) < 2) $this->outputError('unknown method');

		if(!is_callable(array($chunks[0] . 'Api', mb_strtolower($chunks[1]))))
		{
			$this->outputError('unknown method');
		}

		$parameters = $_REQUEST;
		unset($parameters['method']);

		try
		{
			if($chunks[0] == 'users')
			{
				$parameters['userObject'] = $this->currentUser;
			}

			$data = call_user_func(array($chunks[0] . 'Api', mb_strtolower($chunks[1])), $parameters);
			$this->outputSuccess('ok', $data);
		}
		catch(Exception $e)
		{
			$this->outputError($e->getMessage());
		}
	}

	/**
	 * Output
	 *
	 * @param int $code
	 * @param string[optional] $message
	 * @param mixed $data
	 */
	private function output($code, $message = null, $data = null)
	{
		$response['code'] = (int) $code;
		if($message !== null) $response['message'] = (string) $message;
		if($data != null) $response['data'] = $data;

		// output
		SpoonHTTP::setHeaders('Content-type: application/json');
		echo json_encode($response);
		exit;
	}

	/**
	 * Output an error
	 *
	 * @param string $message
	 * @param int[optional] $code
	 */
	private function outputError($message, $code = 500)
	{
		$this->output($code, $message);
	}

	/**
	 * Output a success message
	 *
	 * @param string[optional] $message
	 * @param mixed[optional] $data
	 */
	private function outputSuccess($message = null, $data = null)
	{
		$this->output(200, $message, $data);
	}
}

class commentsApi
{
	/**
	 * Add a comment
	 *
	 * @param array $args
	 * @return bool|Comment
	 */
	public static function add($args)
	{
		if(!isset($args['access_token']) || $args['access_token'] == '') throw new Exception('no access_token');

		$user = User::getByAccessToken($args['access_token']);
		if(!$user) throw new Exception('invalid access_token');

		// @todo	prevent XSS
		$comment = new Comment();
		$comment->userId = $user->id;
		if(isset($args['title']) && $args['title'] != '') $comment->setTitle($args['title']);
		if(isset($args['text']) && $args['text'] != '') $comment->setText($args['text']);
		if(isset($args['video_id']) && $args['video_id'] != '') $comment->setVideoId($args['video_id']);
		if(isset($args['youtube']) && $args['youtube'] != '') $comment->setYoutube($args['youtube']);
		if(isset($args['slideshare']) && $args['slideshare'] != '') $comment->setSlideshare($args['slideshare']);
		if(isset($args['soundcloud']) && $args['soundcloud'] != '') $comment->setSoundcloud($args['soundcloud']);
		if(isset($args['url']) && $args['url'] != '') $comment->setUrl($args['url']);
		if(isset($args['dropbox']) && $args['dropbox'] != '') $comment->setDropbox($args['dropbox']);
		if(isset($args['file_id']) && $args['file_id'] != '') $comment->setFile(self::getTemporaryFile($args['file_id']));
		if(isset($args['picture_id']) && $args['picture_id'] != '') $comment->setPicture(self::getTemporaryFile($args['picture_id']));
		if(isset($args['emotion']) && $args['emotion'] != '') $comment->setEmotion($args['emotion']);
		$comment->save();

		return $comment;
	}

	/**
	 * Get a comment
	 *
	 * @param $args
	 * @return bool|Comment
	 */
	public static function get($args)
	{
		if(!isset($args['access_token']) || $args['access_token'] == '') throw new Exception('no access_token');
		if(!isset($args['id']) || $args['id'] == '') throw new Exception('no id');

		$user = User::getByAccessToken($args['access_token']);
		if(!$user) throw new Exception('invalid access_token');

		$comment = Comment::get($args['id']);

		if($comment === false) return false;

		if($comment->getFile() != '')
		{
			$comment->fileUrl = SITE_URL . Site::getFilesUrl($comment->getFile());
		}
		if($comment->getPicture() != '')
		{
			$comment->pictureUrl = SITE_URL . Site::getFilesUrl($comment->getPicture());
		}

		return $comment;
	}

	/**
	 * Get a temporary files
	 * @param int $id
	 * @return string
	 */
	private static function getTemporaryFile($id)
	{
		$return = Site::getDB()->getVar(
			'SELECT file
			 FROM temporary_files
			 WHERE id = ?',
			$id
		);

		Site::getDB(true)->delete('temporary_files', 'id = ?', $id);
		return $return;
	}

	/**
	 * Upload a temporary file
	 *
	 * @param $args
	 * @return array
	 * @throws Exception
	 */
	public static function uploadTemporaryFile($args)
	{
		if(!isset($args['access_token']) || $args['access_token'] == '') throw new Exception('no access_token');
		if(!isset($args['name']) || $args['name'] == '') throw new Exception('no name');
		$data = file_get_contents('php://input');


		$filename = Site::getFilename() . '.' . SpoonFile::getExtension($args['name']);
		$path = Site::getFilesPath($filename);
		SpoonFile::setContent($path, $data);

		$id = Site::getDB(true)->insert(
			'temporary_files',
			array(
			     'file' => $filename,
			     'created_on' => Site::getUTCDate()
			)
		);

		self::cleanupTemporaryFiles();

		return array(
			'id' => $id,
		);
	}

	/**
	 * Upload a temporary image
	 *
	 * @param $args
	 * @return array
	 * @throws Exception
	 */
	public static function uploadTemporaryImage($args)
	{
		// @todo    validate if image

		if(!isset($args['access_token']) || $args['access_token'] == '') throw new Exception('no access_token');
		if(!isset($args['name']) || $args['name'] == '') throw new Exception('no name');
		if(!isset($args['data']) || $args['data'] == '') throw new Exception('no data');

		$filename = Site::getFilename() . '.' . SpoonFile::getExtension($args['name']);
		$path = Site::getFilesPath($filename);
		SpoonFile::setContent($path, $args['data']);

		$id = Site::getDB(true)->insert(
			'temporary_files',
			array(
			     'file' => $filename,
			     'created_on' => Site::getUTCDate()
			)
		);

		self::cleanupTemporaryFiles();

		return array(
			'id' => $id,
		);
	}

	/**
	 * Cleanup the old temporary files
	 */
	private static function cleanupTemporaryFiles()
	{
		// delete al files that are older the 4u
		$items = (array) Site::getDB()->getPairs(
			'SELECT id, file
			FROM temporary_files
			WHERE created_on <= ?',
			Site::getUTCDate(null, (time() - (4 * 60 * 60)))
		);

		if(!empty($items))
		{
			foreach($items as $id => $row)
			{
				$path = Site::getFilesPath($row['file']);
				SpoonFile::delete($path);
			}

			Site::getDB(true)->delete(
				'temporary_files',
				'id IN (' . implode(', ', array_keys($items)) . ')'
			);
		}
	}
}

class UsersApi
{
	/**
	 * Check if a user is logged in
	 *
	 * @param array $args
	 * @return User
	 */
	public static function isLoggedIn($args)
	{
		if(!isset($args['access_token'])) throw new Exception('no access_token');
		if($args['access_token'] == 'undefined') $args['access_token'] = '';
		if($args['access_token'] == 'null') $args['access_token'] = '';

		if($args['access_token'] == '' && $args['userObject'] == false) throw new Exception('invalid access_token');
		elseif($args['access_token'] == '' && $args['userObject'] !== false) $user = $args['userObject'];
		else $user = User::getByAccessToken($args['access_token']);

		if(!$user) throw new Exception('invalid access_token');

		Site::getDB(true)->update(
			'users_sessions',
			array('edited_on' => Site::getUTCDate()),
			'user_id = ?',
			array($user->id)
		);

        $data = $user->toArray();
        $user->avatar = $data['settings']['avatar'];

		return $user;
	}

	/**
	 * Log off the current user.
	 */
	public static function logOff()
	{
		Authentication::logout();
	}
}