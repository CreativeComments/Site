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
		$config['connectionstring'] = 'rtmp://pmkfq7.cloud.influxis.com/hdfvr/_definst_';

		if(isset($_GET['recorderId'])) { $recorderId = $_GET['recorderId']; }
		$config['languagefile'] = '/core/hdfvr/translations/en.xml';

		$config['qualityurl'] = '/core/hdfvr/profiles/620x330.xml';

		$config['maxRecordingTime'] = 20;
		$config['minRecordTime'] = 1;

		$config['userId'] = '';

		$config['outgoingBuffer'] = 60;
		$config['playbackBuffer'] = 1;
		$config['autoPlay'] = 'false';

		$config['deleteUnsavedFlv'] = 'false';
		$config['hideSaveButton'] = 0;
		$config['onSaveSuccessURL'] = '';
		$config['snapshotSec'] = 5;
		$config['snapshotEnable'] = 'false';

		$config['backgroundColor'] = 0xffffff;
		$config['menuColor'] = 0xffffff;
		$config['radiusCorner'] = 0;
		$config['padding'] = 0;

		$config['showFps'] = 'false';
		$config['showMenu'] = 'false';
		$config['showTimer'] = 'false';
		$config['showSoundBar'] = 'true';

		$config['overlayPath'] = '';
		$config['overlayPosition'] = 'tr';

		$config['recordAgain'] =  'true';
		$config['useUserId'] =  'false';
		$config['disableAudio'] = 'false';
		$config['chmodStreams'] = '';
		$config['countdownTimer'] = 'false';
		$config['loopbackMic'] = 'false';

		$config['streamPrefix'] = '';
		$config['streamName'] = '';

		$config['flipImageHorizontally'] = 'true';

		echo 'donot=removethis';
		foreach ($config as $key => $value){
			echo '&'.$key.'='.$value;
		}

		exit;
	}
}
