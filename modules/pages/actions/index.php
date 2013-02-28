<?php

/**
 * ExampleIndex
 *
 * @package		pages
 * @subpackage	index
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PagesIndex extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// go to dashboard after login
//		if($this->currentUser !== null) $this->redirect($this->url->buildUrl('dashboard', 'users'));

		// parse
		$this->parse();

		// display the page
		$this->display();
	}

	/**
	 * Parse the page
	 *
	 * @return void
	 */
	private function parse()
	{
	}
}
