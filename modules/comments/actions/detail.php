<?php

/**
 * CommentsDetail
 *
 * @package		comments
 * @subpackage	detail
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class CommentsDetail extends SiteBaseAction
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

		// parse
		$this->parseReports();
		$this->parse();

		// display the page
		$this->display();
	}

	/**
	 * Parse
	 *
	 * @return void
	 */
	private function parse()
	{
		$user = User::get($this->item->getUserId());

		// @todo	parse meta/open graph data
		$this->tpl->assign('item', $this->item->toArray(true));
		$this->tpl->assign('user', $user->toArray());
	}
}
