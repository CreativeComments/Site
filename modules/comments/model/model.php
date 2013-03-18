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
	public $fullUrl, $text, $videoId, $youtube, $slideshare, $url, $dropbox, $file, $emotion = 'neutral', $picture;

	/**
	 * DateTime properties
	 *
	 * @var DateTime
	 */
	public $createdOn, $editedOn;

	/**
	 * @param \DateTime $createdOn
	 */
	public function setCreatedOn($createdOn)
	{
		$this->createdOn = $createdOn;
	}

	/**
	 * @return \DateTime
	 */
	public function getCreatedOn()
	{
		return $this->createdOn;
	}

	/**
	 * @param string $dropbox
	 */
	public function setDropbox($dropbox)
	{
		$this->dropbox = $dropbox;
	}

	/**
	 * @return string
	 */
	public function getDropbox()
	{
		return $this->dropbox;
	}

	/**
	 * @param \DateTime $editedOn
	 */
	public function setEditedOn($editedOn)
	{
		$this->editedOn = $editedOn;
	}

	/**
	 * @return \DateTime
	 */
	public function getEditedOn()
	{
		return $this->editedOn;
	}

	/**
	 * @param string $emotion
	 */
	public function setEmotion($emotion)
	{
		if(!in_array($emotion, array('sad', 'neutral', 'happy')))
		{
			$emotion = 'neutral';
		}

		$this->emotion = $emotion;
	}

	/**
	 * @return string
	 */
	public function getEmotion()
	{
		return $this->emotion;
	}

	/**
	 * @param string $file
	 */
	public function setFile($file)
	{
		$this->file = $file;
	}

	/**
	 * @return string
	 */
	public function getFile()
	{
		return $this->file;
	}

	/**
	 * @param string $fullUrl
	 */
	public function setFullUrl($fullUrl)
	{
		$this->fullUrl = $fullUrl;
	}

	/**
	 * @return string
	 */
	public function getFullUrl()
	{
		return $this->fullUrl;
	}

	/**
	 * @param int $id
	 */
	public function setId($id)
	{
		$this->id = $id;
	}

	/**
	 * @return int
	 */
	public function getId()
	{
		return $this->id;
	}

	/**
	 * @param string $picture
	 */
	public function setPicture($picture)
	{
		$this->picture = $picture;
	}

	/**
	 * @return string
	 */
	public function getPicture()
	{
		return $this->picture;
	}

	/**
	 * @param string $slideshare
	 */
	public function setSlideshare($slideshare)
	{
		$this->slideshare = $slideshare;
	}

	/**
	 * @return string
	 */
	public function getSlideshare()
	{
		return $this->slideshare;
	}

	/**
	 * @param string $text
	 */
	public function setText($text)
	{
		$text = trim($text, '<br>');
		if($text == '') $text = null;

		$this->text = $text;
	}

	/**
	 * @return string
	 */
	public function getText()
	{
		return $this->text;
	}

	/**
	 * @param int $userId
	 */
	public function setUserId($userId)
	{
		$this->userId = $userId;
	}

	/**
	 * @return int
	 */
	public function getUserId()
	{
		return $this->userId;
	}

	/**
	 * @param string $url
	 */
	public function setUrl($url)
	{
		$this->url = $url;
	}

	/**
	 * @return string
	 */
	public function getUrl()
	{
		return $this->url;
	}

	/**
	 * @param string $videoId
	 */
	public function setVideoId($videoId)
	{
		$this->videoId = $videoId;
	}

	/**
	 * @return string
	 */
	public function getVideoId()
	{
		return $this->videoId;
	}

	/**
	 * @param string $youtube
	 */
	public function setYoutube($youtube)
	{
		$this->youtube = $youtube;
	}

	/**
	 * @return string
	 */
	public function getYoutube()
	{
		return $this->youtube;
	}

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
	 * @return string
	 */
	public function getOGImageUrl()
	{
		// should we generate the image?
		if(!SpoonFile::exists(PATH_WWW . '/files/comments/og/' . $this->id . '.png'))
		{
			$stillPath = PATH_WWW . '/files/comments/temp/' . $this->id . '.jpg';
			$stillContent = SpoonHTTP::getContent(
				'http://api.nimbb.com/Live/Thumbnail.aspx?key=' . NIMB_PUBLIC_KEY . '&guid=' . $this->videoId,
				array(
				     CURLOPT_USERAGENT => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13',
				)
			);
			SpoonFile::setContent(
				$stillPath,
				$stillContent
			);

			// create images
			$still = new Imagick($stillPath);
			$overlay = new Imagick(PATH_WWW . '/core/layout/images/emotion_overlays/' . $this->emotion . '.png');

			$size = getimagesize($stillPath);

			// add overlay
			$still->compositeimage($overlay, Imagick::COMPOSITE_DEFAULT, (floor($size[0] / 2) - 100), (floor($size[1] / 2)) - 100);
			$still->writeimage(PATH_WWW . '/files/comments/og/' . $this->id . '.png');

			// cleanup
			SpoonFile::delete($stillPath);
		}

		return '/files/comments/og/' . $this->id . '.png';
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
		if(isset($data['youtube'])) $this->youtube = (string) $data['youtube'];
		if(isset($data['slideshare'])) $this->slideshare = (string) $data['slideshare'];
		if(isset($data['url'])) $this->url = (string) $data['url'];
		if(isset($data['dropbox'])) $this->dropbox = (string) $data['dropbox'];
		if(isset($data['file'])) $this->file = (string) $data['file'];
		if(isset($data['picture'])) $this->picture = (string) $data['picture'];
		if(isset($data['emotion'])) $this->emotion = (string) $data['emotion'];
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
		$item['youtube'] = $this->youtube;
		$item['slideshare'] = $this->slideshare;
		$item['url'] = $this->url;
		$item['dropbox'] = $this->dropbox;
		$item['file'] = $this->file;
		$item['picture'] = $this->picture;
		$item['emotion'] = $this->emotion;
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
	public function toArray($onSite = false)
	{
		// build array
		$item['id'] = $this->id;
		$item['user_id'] = $this->getUserId();
		$item['text'] = $this->getText();
		$item['videoId'] = $this->getVideoId();
		$item['youtube'] = $this->getYoutube();
		$item['slideshare'] = $this->getSlideshare();
		$item['url'] = $this->getUrl();
		$item['dropbox'] = $this->getDropbox();
		$item['file'] = $this->getFile();
		$item['fileUrl'] = ($this->getFile() != null) ? Site::getFilesUrl($this->getFile()) : null;
		$item['picture'] = $this->getPicture();
		$item['pictureUrl'] = ($this->getPicture() != null) ? Site::getFilesUrl($this->getPicture()) : null;
		$item['emotion'] = $this->getEmotion();
		$item['createdOn'] = ($this->createdOn !== null) ? $this->createdOn->getTimestamp() : null;
		$item['editedOn'] = ($this->editedOn !== null) ? $this->editedOn->getTimestamp() : null;

		$item['video_flash_278x135'] = CommentsHelper::buildFlashOutput($this->getVideoId(), 278, 135);
		$item['video_flash_600x450'] = CommentsHelper::buildFlashOutput($this->getVideoId(), 600, 450);

		if($onSite)
		{
			if($item['youtube'] != '')
			{
				$item['youtube'] = preg_replace('|width="[0-9]*"|iU', 'width="610"', $item['youtube']);
				$item['youtube'] = preg_replace('|height="[0-9]*"|iU', 'height="450"', $item['youtube']);
			}

			if($item['slideshare'] != '')
			{
				$item['slideshare'] = preg_replace('|width="[0-9]*"|iU', 'width="610"', $item['slideshare']);
				$item['slideshare'] = preg_replace('|height="[0-9]*"|iU', 'height="450"', $item['slideshare']);
			}
		}

		return $item;
	}
}

class CommentsHelper {

	/**
	 * Build Flash output for the video
	 *
	 * @param $id
	 * @param $width
	 * @param $height
	 * @return string
	 */
	public static function buildFlashOutput($id, $width, $height)
	{
		$output =   '<object id="video-%1$s" width="%2$s" height="%3$s">
						<param name="movie" value="https://player.nimbb.com/nimbb.swf?guid=%1$s&key=' . NIMB_PUBLIC_KEY . '&nologo=1&autoplay=1" />
						<param name="allowScriptAccess" value="always" />
						<embed name="nimbb" src="https://player.nimbb.com/nimbb.swf?guid=%1$s&key=' . NIMB_PUBLIC_KEY . '&nologo=1&autoplay=1" width="%2$s" height="%3$s" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>
					</object>';
		$output = sprintf($output, $id, $width, $height);
		return $output;
	}

	/**
	 * Get the most recent comments
	 *
	 * @param int[optional] $limit
	 * @return array
	 */
	public static function getMostRecent($limit = 8)
	{
		$data = Site::getDB()->getRecords(
			'SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
			FROM comments AS i
			ORDER BY i.created_on DESC
			LIMIT ?',
			array($limit)
		);

		$return = array();

		if(!empty($data))
		{
			foreach($data as $row)
			{
				$comment = new Comment();
				$comment->initialize($row);
				$return[$row['id']] = $comment;
			}
		}

		return $return;
	}

	/**
	 * @todo    add pagina, so we can implement infinite scroll
	 *
	 * @param $id
	 * @return array
	 */
	public static function getForUser($id)
	{
		$data = Site::getDB()->getRecords(
			'SELECT i.*, UNIX_TIMESTAMP(i.created_on) AS created_on, UNIX_TIMESTAMP(i.edited_on) AS edited_on
			FROM comments AS i
			WHERE i.user_id = ?
			ORDER BY i.created_on DESC',
			array($id)
		);

		$return = array();

		if(!empty($data))
		{
			foreach($data as $row)
			{
				$comment = new Comment();
				$comment->initialize($row);
				$return[$row['id']] = $comment;
			}
		}

		return $return;
	}
}
