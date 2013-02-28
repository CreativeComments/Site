<?php

/**
 * UsersDashboard
 *
 * @package		users
 * @subpackage	dashboard
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class UsersDashboard extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// check if logged in
		if(!$this->currentUser)
		{
			$this->redirect(
				$this->url->buildUrl('index', 'error', null, array('code' => 403, 'message' => 'forbidden')),
				403
			);
		}

		$this->parseReports();
		$this->parse();
		$this->display();
	}

	/**
	 * Parse
	 *
	 * @return void
	 */
	private function parse()
	{
		$comments = CommentsHelper::getForUser($this->currentUser->id);
		$items = array();
		$i = 1;
		foreach($comments as $comment)
		{
			$data = $comment->toArray();
			$data['user'] = $this->currentUser->toArray();
			$data['newRow'] = false;
			if($i % 3 == 0) $data['newRow'] = true;

			$items[] = $data;
			$i++;
		}

		$this->tpl->assign('items', $items);
	}
}
