<?php

/**
 * PagesPrivacyPolicy
 *
 * @package		pages
 * @subpackage	privacy_policy
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PagesPrivacyPolicy extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$this->tpl->assign('pageTitle', 'Privacy policy');
		$this->display();
	}
}
