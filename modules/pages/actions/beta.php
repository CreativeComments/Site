<?php

/**
 * Pagesbeta
 *
 * @package		pages
 * @subpackage	index
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class PagesBeta extends SiteBaseAction
{
	/**
	 * @var SiteForm
	 */
	private $frm;

	/**
	 * Execute the action
	 *
	 * @return void
	 */
	public function execute()
	{
		$this->frm = new SiteForm('beta');
		$this->frm->addPassword('password')->setAttributes(
			array(
			     'required' => null,
			     'placeholder' => 'our little secret',
			)
		);

		if($this->frm->isSubmitted()) {
			if($this->frm->getField('password')->isFilled(SiteLocale::err('FieldIsRequired'))) {
				if($this->frm->getField('password')->getValue() == CC_BETA_PASSWORD) {
					// give the user access
					$this->currentUser->hasAccess = true;
					$this->currentUser->save();

					$this->redirect('/en?report=beta-success', 307);
				} else {
					$this->frm->getField('password')->addError('Sorry, no can do!');
				}
			}
		}

		$this->frm->parse($this->tpl);

		$this->display();
	}
}
