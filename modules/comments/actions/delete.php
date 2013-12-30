<?php

/**
 * CommentsDetail
 *
 * @package        comments
 * @subpackage     detail
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          1.0
 */
class CommentsDelete extends SiteBaseAction
{

    /** @var Comment */
    protected $item;

    /**
     * Execute the action
     *
     * @return void
     */
    public function execute()
    {
        $id = $this->url->getParameter(1, 'int');
        $this->item = Comment::get($id);
        if (!$this->item) {
            $this->redirect($this->url->buildUrl('', '', null, array('error' => 'generalError')));
        }
        if ($this->canDelete()) {
            //$this->item->delete();
            $this->redirect($this->url->buildUrl('', '', null, array('report' => 'deleted')));
        } else {
            $this->redirect($this->url->buildUrl('', '', null, array('error' => 'forbidden')));
        }
    }

    /**
     * @return bool
     */
    public function canDelete()
    {
        $user = $this->currentUser;
        if ($user) {
            if ($user->isAdmin) {
                return true;
            }
            if ($this->item->userId == $user->id) {
                return true;
            }
        }

        return false;
    }
}
