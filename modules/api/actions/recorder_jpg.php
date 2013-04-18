<?php

/**
 * ApiRecorderSettings
 *
 * @package		api
 * @subpackage	recorder_settings
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ApiRecorderSettings extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
//		$photoName = $_GET["name"];
//		$recorderId= $_GET["recorderId"];
//
//		$filename = Site::getFilename() . '.jpg';
//
//
//
//if(!is_dir("snapshots")){
//	$res = mkdir("snapshots",0777);
//}
//
////it also sends the snapshot JPG info via POST
//if(isset($GLOBALS["HTTP_RAW_POST_DATA"])){
//	$image = fopen("snapshots/".$photoName,"wb");
//	fwrite($image , $GLOBALS["HTTP_RAW_POST_DATA"] );
//	fclose($image);
//}
//
		echo "save=ok";
		exit;
	}
}
