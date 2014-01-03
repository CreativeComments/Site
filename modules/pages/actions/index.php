<?php

/**
 * ExampleIndex
 *
 * @package        pages
 * @subpackage     index
 *
 * @author         Tijs Verkoyen <tijs@sumocoders.be>
 * @since          1.0
 */
class PagesIndex extends SiteBaseAction
{
    /**
     * Execute the action
     *
     * @return void
     */
    public function execute()
    {
        $this->parseReports();
        $this->parse();
        $this->display();
    }

    /**
     * Parse the page
     *
     * @return void
     */
    private function parse()
    {
        $this->parseMostRecent();
    }

    private function parseMostRecent()
    {
        $mostRecent = CommentsHelper::getMostRecent();

        // if there are no recent items we shouldn't do anything
        if (empty($mostRecent)) {
            return false;
        }

        $userIds = array();

        foreach ($mostRecent as $row) {
            $userIds[] = $row->userId;
        }

        $userIds = array_unique($userIds);

        $userData = (array) Site::getDB()->getRecords(
            'SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
                 FROM users AS i
                 WHERE i.id IN (' . implode(', ', $userIds) . ')'
        );

        $users = array();
        foreach ($userData as $row) {
            $user = new User();
            $user->initialize($row);
            $users[$row['id']] = $user;
        }

        $items = array();
        $i = 1;
        foreach ($mostRecent as $comment) {
            if (!isset($users[$comment->userId])) {
                continue;
            }

            $data = $comment->toArray();
            $data['user'] = $users[$comment->userId]->toArray();
            $data['newRow'] = false;
            if ($i % 4 == 0) {
                $data['newRow'] = true;
                $i = 1;
            }

            $data['canDelete'] = $comment->canDelete($this->currentUser);

            $items[] = $data;
            $i++;
        }

        $this->tpl->assign('items', $items);
    }
}
