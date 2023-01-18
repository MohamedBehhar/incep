<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
* * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
// define( 'DB_NAME', getenv('MYSQL_DATABASE') );
define( 'DB_NAME', 'wp' );

/** MySQL database username */
// define( 'DB_USER', getenv('MYSQL_USER')  );
define( 'DB_USER', 'mbehhar'  );

/** MySQL database password */
// define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );
define( 'DB_PASSWORD', '1234' );

/** MySQL hostname */
// define( 'DB_HOST', getenv('DB_HOST') );
define( 'DB_HOST', 'mariadb:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'wtgw/LM$v?)eXZmt,W6A~a;X28gM (87i=bjit&fLqUA6JsZ~mj+dCE{U|J42ko:');
	define('SECURE_AUTH_KEY',  'RvXz3NhKr6>38KRsHhH`4mO4uur^2C+==C,I5-qWB@+R$QPLM<X3+`FEso8E&fXk');
	define('LOGGED_IN_KEY',    '8&;JuOGP}NA&VtVX|}|CJmDF-c$E;z`.vncMo56I<)_f!YZppP^M7Y<TlwC2YZFQ');
	define('NONCE_KEY',        'L4F#y&-7di/N|Kks$8U,na=Bj hA//+(ms:t6iWA=:-PLD^Qvc|8*&]>h%FiCBd.');
	define('AUTH_SALT',        '[~-GPaQ,J%v|Jj4:l.6rMqi,sw#1}|~oTq+#.3va/dkl8!J7gjB(k[35[ybG:)ED');
	define('SECURE_AUTH_SALT', 'QIeB#r9v@cC=,rESi(-ifa.3~fn(3kS8}P66Pz)[Dkk54)2+~509azIyd[ZuF9Vl');
	define('LOGGED_IN_SALT',   '}~vjWmDp/O5ge({EM6xIs))Coj&jGbjgw i+ysoV`KJvj`F&i{ya+:T|nX_I/X/Q');
	define('NONCE_SALT',       'D{6#+es|^bT<(HI=><dg66%w5r2ulQtOZ?5B+1bNXw-cd:#Cg0GyG`B:KP-+sy2~');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
