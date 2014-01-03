<?php

/**
 * ApiRecorder
 *
 * @package		api
 * @subpackage	server
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ApiRecorder extends SiteBaseAction
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

        if(SpoonFilter::getGetValue('debug', array('true', 'false'), 'false') == 'true')
        {
            $this->tpl->assign('showDebug', true);
        }

		$this->display();
	}
}
