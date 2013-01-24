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
		if(isset($args['text']) && $args['text'] != '') $comment->text = $args['text'];
		if(isset($args['video_id']) && $args['video_id'] != '') $comment->videoId = $args['video_id'];
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

		return $comment;
	}
}

class UsersApi
{
	/**
	 * Check if a user is logged in
	 *
	 * @param array $args
	 * @return array
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
		return $user;
	}
}