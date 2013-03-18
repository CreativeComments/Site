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
		$title = SiteTemplateModifiers::truncate($this->item->getText(), 20, false);
		if(mb_strlen($this->item->getText()) > 20) $title .= '...';
		if($title == '') $title = 'Creative Comments video message - click for more...';
		$url = SITE_URL . $this->item->getFullUrl();
		$imageUrl = SITE_URL; // . $this->item->getOGImageUrl();

		$content = SiteTemplateModifiers::truncate($this->item->getText(), 255, false);
		if(mb_strlen($this->item->getText()) > 255) $content . '...';
		if($content == '') $content = 'Click title to watch video message';

		// build meta
		$meta = '<meta property="og:title" content="' . $title . '">' . "\n";
		$meta .= '<meta property="og:type" content="website">' . "\n";
		$meta .= '<meta property="og:url" content="' . $url . '">' . "\n";
		$meta .= '<meta property="og:image" content="' . $imageUrl . '">' . "\n";
		$meta .= '<meta property="og:site_name" content="Creative Comments - Spice-up the conversation!">' . "\n";
		$meta .= '<meta property="og:description" content="' . $content . '">' . "\n";

		$this->tpl->assign('meta', $meta);

		$user = User::get($this->item->getUserId());

		// @todo	parse meta/open graph data
		$this->tpl->assign('item', $this->item->toArray(true));
		$this->tpl->assign('user', $user->toArray());
	}
}
