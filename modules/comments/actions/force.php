<?php

/**
 * CommentsDetail
 *
 * @package		comments
 * @subpackage	force
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class CommentsForce extends SiteBaseAction
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
		$id = $this->url->getParameter('id', 'int');
		$type = $this->url->getParameter('type');
		$this->item = Comment::get($id);
		if(!$this->item) $this->redirect($this->url->buildUrl('index', null, null, array('error' => 'invalid-record')));

		switch($type)
		{
			case 'picture':
				$file = $this->item->getPicture();
				break;
			case 'file':
				$file = $this->item->getFile();
				break;

			default:
				$this->redirect($this->url->buildUrl('index', null, null, array('error' => 'invalid-record')));
		}

		SpoonHTTP::setHeaders(
			array(
				'Content-Description: File Transfer',
				'Content-Type: application/octet-stream',
				'Content-Disposition: attachment; filename=' . basename($file),
				'Content-Transfer-Encoding: binary',
				'Expires: 0',
				'Cache-Control: must-revalidate',
				'Pragma: public',
			)
		);


		readfile(Site::getFilesPath($file));
		exit;
	}
}
