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
		$config['minRecordTime'] = 2;

		$config['userId']='';

		$config['outgoingBuffer']=60;
		$config['playbackBuffer']= 1;
		$config['autoPlay']='false';

		$config['deleteUnsavedFlv'] = 'false';
		$config['hideSaveButton']=1;
		$config['onSaveSuccessURL']='';
		$config['snapshotSec'] = 5;
		$config['snapshotEnable'] = 'true';

		/**
		 * Design
		 */
		$config['backgroundColor'] = 0xffffff;
		$config['menuColor'] = 0xffffff;
		$config['radiusCorner'] = 0;
		$config['padding'] = 0;

		$config['showFps'] = 'true';
		$config['recordAgain'] =  'true';
		$config['useUserId'] =  'false';
		$config['streamPrefix'] = '';
		$config['streamName'] = '';
		$config['disableAudio'] = 'false';
		$config['chmodStreams'] = '';
		$config['countdownTimer']='false';
		$config['overlayPath']='';
		$config['overlayPosition']='tr';
		$config['loopbackMic']='false';
		$config['showMenu'] ='false';
		$config['showTimer'] = 'false';
		$config['showSoundBar'] = 'true';
		echo 'donot=removethis';
		foreach ($config as $key => $value){
			echo '&'.$key.'='.$value;
		}

		exit;
	}
}
