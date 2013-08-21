<?php
define('REQUEST_MICROTIME', microtime(true));
chdir(dirname(__DIR__));

if (php_sapi_name() === 'cli-server' && is_file(__DIR__ . parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH))) {
    return false;
}

if (!file_exists('vendor/autoload.php')) {
    throw new RuntimeException('Run `php composer.phar install`.');
}

include 'vendor/autoload.php';

Zend\Mvc\Application::init(require 'config/application.config.php')->run();
