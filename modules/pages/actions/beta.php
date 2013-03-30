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
		if($this->currentUser != false && $this->currentUser->hasAccess)
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
						$this->redirect('/en?report=beta-success', 307);
					} else {
						$this->frm->getField('password')->addError(SiteLocale::err('WrongPassword'));
					}
				}
			}

			$this->frm->parse($this->tpl);
		}

		else
		{
			$this->tpl->assign('redirect', true);
		}

		$this->display();
	}
}
