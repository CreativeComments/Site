ALTER TABLE comments ADD youtube TEXT NULL DEFAULT NULL AFTER video_id, ADD slideshare TEXT NULL DEFAULT NULL AFTER youtube;