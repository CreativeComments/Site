<?php

/**
 * PagesPlugins
 *
 * @package		pages
 * @subpackage	plugins
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PagesPlugins extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$this->tpl->assign('pageTitle', 'Plugins');
		$this->display();
	}
}
