<?php

/**
 * Global configuration options and constants
 *
 * @author	Tijs Verkoyen <tijs@sumocoders.be>
 */

/**
 * Spoon configuration
 */
// should the debug information be shown
define('SPOON_DEBUG', true);
// mailaddress where the exceptions will be mailed to
define('SPOON_DEBUG_EMAIL', '');
// message for the visitors when an exception occur
define('SPOON_DEBUG_MESSAGE', 'Internal error.');
// default charset used in spoon.
define('SPOON_CHARSET', 'utf-8');

/**
 * Database configuration
 * @remark remove if you don't need a database
 */
// type of connection
define('DB_TYPE', 'mysql');
// database name
define('DB_DATABASE', '<database_name>');
// database host
define('DB_HOSTNAME', '<database_server>');
// database username
define('DB_USERNAME', '<database_username>');
// datebase password
define('DB_PASSWORD', '<database_password>');


/**
 * Site configuration
 */
// the domain (without http)
define('SITE_DOMAIN', isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '<url>');	// @todo provide correct url
// the default title
define('SITE_DEFAULT_TITLE', '<name>'); // @todo	correct title
// the url
define('SITE_URL', 'http://' . SITE_DOMAIN);

/**
 * Path configuration
 *
 * Depends on the server layout
 */
// path to the website itself
define('PATH_WWW', realpath(dirname(__FILE__) . '/../'));
// path to the library
define('PATH_LIBRARY', realpath(dirname(__FILE__)));

/**
 * Facebook configuration
 */
define('FB_APP_ID', '338832809543889');
define('FB_APP_SECRET', '711eb25558ea44d63146bb9142b81e37');

/**
 * Nimbb configuration
 */
define('NIMB_PUBLIC_KEY', '373f5c99d7');
define('NIMB_PRIVATE_KEY', '283b815418');

/**
 * Beta configuration
 */
define('CC_BETA_PASSWORD', 'thisisoursecretbetacode');

/**
 * Errbit configuration
 */
define('ERRBIT_API_KEY', '');
require_once PATH_LIBRARY . '/external/sumo.php';