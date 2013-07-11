<?php

/**
 * ApiPlayer
 *
 * @package		api
 * @subpackage	server
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ApiPlayer extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$this->tpl->assign(
			'data',
			array(
			     'videoId' => SpoonFilter::getGetValue('id', null, '')
			)
		);
		$this->display();
	}
}
