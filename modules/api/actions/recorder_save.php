<?php

/**
 * ApiRecorderSave
 *
 * @package		api
 * @subpackage	recorder_save
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class ApiRecorderSave extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$streamName=$_GET["streamName"];
		$streamDuration=$_GET["streamDuration"];
		$userId= $_GET["userId"];
		$recorderId= $_GET["recorderId"];

		echo "save=ok";
		exit;
	}
}