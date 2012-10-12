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
		$allowedVersions = $this->getVersions();
		$allowedBrowsers = array_keys($allowedVersions);

		$browser = mb_strtolower(SpoonFilter::getGetValue('browser', $allowedBrowsers, ''));
		if($browser == '') $this->redirect($this->url->buildUrl('index', 'error', null, array('code' => 404, 'message' => 'file-not-found')));
		$version = SpoonFilter::getGetValue('version', array_keys($allowedVersions[$browser]), '');
		if($version == '') $this->redirect($this->url->buildUrl('index', 'error', null, array('code' => 404, 'message' => 'file-not-found')));

		// output the file
		$this->redirect($allowedVersions[$browser][$version]['url']);
	}

	/**
	 * Get all plugin versions
	 *
	 * @return array
	 */
	private function getVersions()
	{
		$path = PATH_WWW . '/files/plugins';
		$return = array();
		$browsers = (array) SpoonDirectory::getList($path);

		foreach($browsers as $browser)
		{
			$versions = (array) SpoonDirectory::getList($path . '/' . $browser, true);

			foreach($versions as $version)
			{
				$extension = SpoonFile::getExtension($version);
				$versionNumber = substr($version, mb_strrpos($version, '_') + 1, mb_strlen($version) - mb_strlen($extension) - mb_strrpos($version, '_') - 2);

				$return[$browser][$versionNumber] = array(
					'version' => $versionNumber,
					'path' => $path . '/' . $browser . '/'. $version,
					'url' => '/files/plugins/' . $browser . '/'. $version,
				);
			}

			// sort by version
			uasort($return[$browser], array(__CLASS__, 'sortByVersion'));

			// add the latest
			$return[$browser]['latest'] = end($return[$browser]);
		}

		return $return;
	}

	/**
	 * Sort the elements by their version
	 *
	 * @param array $version1
	 * @param array $version2
	 * @return int
	 */
	public static function sortByVersion(array $version1, array $version2)
	{
		if(!isset($version1['version']) || !isset($version2['version'])) return 0;
		return version_compare($version1['version'], $version2['version']);
	}
}
