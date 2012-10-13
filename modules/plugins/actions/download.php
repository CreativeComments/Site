<?php

/**
 * PluginsDownload
 *
 * @package		plugins
 * @subpackage	download
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PluginsDownload extends SiteBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$allowedVersions = PluginHelper::getVersions();
		$allowedBrowsers = array_keys($allowedVersions);

		$browser = mb_strtolower(SpoonFilter::getGetValue('browser', $allowedBrowsers, ''));
		if($browser == '') $this->redirect($this->url->buildUrl('index', 'error', null, array('code' => 404, 'message' => 'file-not-found')));
		$version = SpoonFilter::getGetValue('version', array_keys($allowedVersions[$browser]), '');
		if($version == '') $this->redirect($this->url->buildUrl('index', 'error', null, array('code' => 404, 'message' => 'file-not-found')));

		// output the file
		$this->redirect($allowedVersions[$browser][$version]['url']);
	}
}
