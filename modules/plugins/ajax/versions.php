<?php

/**
 * AjaxPluginsVersions
 *
 * @package		plugins
 * @subpackage	versions
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class AjaxPluginsVersions extends AjaxBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// output
		SpoonHTTP::setHeaders('Content-type: application/json');
		echo json_encode(array('code' => 200, 'data' => PluginHelper::getVersions()));
		exit;
	}
}
