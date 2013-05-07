<?php

/**
 * PagesRedirect
 *
 * @package		pages
 * @subpackage	redirect
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PagesRedirect extends SiteBaseAction
{
	/**
	 * @var SiteForm
	 */
	private $frm;

	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$this->tpl->assign('pageTitle', 'Redirect ...');
		$this->display();
	}
}
