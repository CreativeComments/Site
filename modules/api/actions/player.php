<?php

/**
 * ApiRecorder
 *
 * @package		api
 * @subpackage	player
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
		$id = $this->url->getParameter(1, 'int');
		$this->item = Comment::get($id);
		if(!$this->item) $this->redirect($this->url->buildUrl('index', null, null, array('error' => 'invalid-record')));

		$this->tpl->assign('item', $this->item->toArray());

		$this->display();
	}
}
