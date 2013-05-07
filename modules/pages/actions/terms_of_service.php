<?php

/**
 * PagesTermsOfService
 *
 * @package		pages
 * @subpackage	terms_of_service
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PagesTermsOfService extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$this->tpl->assign('pageTitle', 'Terms of service');
		$this->display();
	}
}
