<?php

/**
 * CommentsDetail
 *
 * @package		comments
 * @subpackage	report
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class CommentsReport extends SiteBaseAction
{
	/**
	 * @var Comment
	 */
	private $item;

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

		// @todo	send a mail
		$this->redirect($this->item->fullUrl . '?report=reported');
	}
}
