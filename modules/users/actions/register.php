<?php

/**
 * UsersRegister
 *
 * @package		users
 * @subpackage	register
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class UsersRegister extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// redirect if a user is already logged in
		if($this->currentUser != null)
		{
			// grab the url if provided
			$url = SpoonFilter::getGetValue('redirect', null, $this->url->buildUrl('dashboard', 'users'));

			// add a report
			if(substr_count($url, '?') > 0) $url .= '&report=logged-in';
			else $url .= '?report=logged-in';

			// redirect
			$this->redirect($url);
		}

		$this->display();
	}
}
