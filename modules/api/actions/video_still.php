<?php

/**
 * ApiVideoStill
 *
 * @package		api
 * @subpackage	video_still
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ApiVideoStill extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$videoId = SpoonFilter::getGetValue('video', null, '');
		if($videoId == '') exit;

		$id = (int) Site::getDB()->getVar(
			'SELECT i.id
			FROM comments AS i
			WHERE i.video_id = ?',
			$videoId
		);

		if($id != 0)
		{
			$filename = Site::getFilename() . '.jpg';
			$path = Site::getFilesPath($filename);
			SpoonFile::setContent($path, $GLOBALS['HTTP_RAW_POST_DATA']);

			Site::getDB(true)->update(
				'comments',
				array('video_still' => $filename),
				'id = ?',
				array($id)
			);
		}
		exit;
	}
}
