ALTER TABLE `users` MODIFY COLUMN `twitter_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL AFTER `facebook_id`;



ALTER TABLE `comments` ADD `flickr` VARCHAR(255)  NULL  DEFAULT NULL  AFTER `soundcloud`;
