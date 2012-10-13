<?php

/**
 * User
 *
 * @package		plugins
 * @subpackage	model
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PluginHelper
{
	/**
	 * Get all plugin versions
	 *
	 * @return array
	 */
	public static function getVersions()
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

