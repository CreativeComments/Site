<?php

/**
 * UsersDashboard
 *
 * @package		users
 * @subpackage	dashboard
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class UsersDashboard extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// check if logged in
		if(!$this->currentUser)
		{
			$this->redirect(
				$this->url->buildUrl('index', 'error', null, array('code' => 403, 'message' => 'forbidden')),
				403
			);
		}

		// show reports
		$this->parseReports();

		// parse
		$this->parse();

		// display the page
		$this->display();
	}

	/**
	 * Parse
	 *
	 * @return void
	 */
	private function parse()
	{
	}
}
