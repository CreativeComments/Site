<?php

/**
 * Comment
 *
 * @package		comments
 * @subpackage	model
 *
 * @author 		Tijs Verkoyen <tijs@sumocoders.be>
 * @since		1.0
 */
class Comment
{
	/**
	 * The id of the comment.
	 *
	 * @var	int
	 */
	public $id, $userId;

	/**
	 * Textual properties
	 *
	 * @var	string
	 */
	public $fullUrl, $text, $videoId;

	/**
	 * DateTime properties
	 *
	 * @var DateTime
	 */
	public $createdOn, $editedOn;

	/**
	 * Get a comment
	 *
	 * @param int $id		The id of the comment.
	 * @return Comment
	 */
	public static function get($id)
	{
		// redefine
		$id = (int) $id;

		// get data
		$data = Site::getDB()->getRecord('SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
											FROM comments AS i
											WHERE i.id = ?',
											array($id));

		// validate
		if($data === null) return false;

		// create instance
		$item = new Comment();

		// initialize
		$item->initialize($data);

		// return
		return $item;
	}

	/**
	 * Initialize the object.
	 *
	 * @param array $data		The data in an array.
	 * @return Comment
	 */
	public function initialize($data)
	{
		if(isset($data['id']))
		{
			$this->id = (int) $data['id'];
			$this->fullUrl = Spoon::get('url')->buildUrl('detail', 'comments') . '/' . $this->id;
		}
		if(isset($data['user_id'])) $this->userId = (int) $data['user_id'];
		if(isset($data['text'])) $this->text = (string) $data['text'];
		if(isset($data['video_id'])) $this->videoId = (string) $data['video_id'];
		if(isset($data['created_on'])) $this->createdOn = new DateTime('@' . $data['created_on']);
		if(isset($data['edited_on'])) $this->editedOn = new DateTime('@' . $data['edited_on']);
	}

	/**
	 * Save the user
	 *
	 * @return bool
	 */
	public function save()
	{
		$this->editedOn = new DateTime();

		// build record
		$item['user_id'] = $this->userId;
		$item['text'] = $this->text;
		$item['video_id'] = $this->videoId;
		$item['edited_on'] = Site::getUTCDate('Y-m-d H:i:s', $this->editedOn->getTimestamp());

		// non existing
		if($this->id === null)
		{
			$this->createdOn = new DateTime();
			$item['created_on'] = Site::getUTCDate('Y-m-d H:i:s', $this->createdOn->getTimestamp());
			$this->id = Site::getDB(true)->insert('comments', $item);
		}
		else Site::getDB(true)->update('comments', $item, 'id = ?', $this->id);

		$this->fullUrl = Spoon::get('url')->buildUrl('detail', 'comments') . '/' . $this->id;

		// return
		return true;
	}

	/**
	 * Return the object as an array
	 *
	 * @return array
	 */
	public function toArray()
	{
		// build array
		$item['id'] = $this->id;
		$item['user_id'] = $this->userId;
		$item['text'] = $this->text;
		$item['videoId'] = $this->videoId;
		$item['createdOn'] = ($this->createdOn !== null) ? $this->createdOn->getTimestamp() : null;
		$item['editedOn'] = ($this->editedOn !== null) ? $this->editedOn->getTimestamp() : null;

		return $item;
	}
}
