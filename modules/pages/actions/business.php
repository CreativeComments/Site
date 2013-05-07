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
class PagesBusiness extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$this->tpl->assign('pageTitle', 'For business');
		$this->display();
	}
}
