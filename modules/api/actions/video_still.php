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

		SpoonFile::setContent(
			PATH_WWW . '/files/comments/temp/' . $videoId . '.png',
			$GLOBALS['HTTP_RAW_POST_DATA']
		);
	}
}
