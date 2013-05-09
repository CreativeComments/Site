<?php

/**
 * AjaxPagesBeta
 *
 * @package		pages
 * @subpackage	beta
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class AjaxPagesBeta extends AjaxBaseAction
{
	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		// get the term
		$code = SpoonFilter::getPostValue('code', null, '');

		// return
		$response['code'] = ($code == CC_BETA_PASSWORD) ? 200 : 404;
		$response['message'] = 'ok';

		// output
		echo json_encode($response);
		exit;
	}
}
