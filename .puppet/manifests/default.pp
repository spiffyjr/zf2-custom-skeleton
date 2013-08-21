group { 'puppet': ensure => present }
Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
File { owner => 0, group => 0, mode => 0644 }

class {'apt':
  always_apt_update => true,
}

Class['::apt::update'] -> Package <|
    title != 'python-software-properties'
and title != 'software-properties-common'
|>


class { 'puphpet::dotfiles': }

package { [
    'build-essential',
    'vim',
    'curl',
    'git-core'
  ]:
  ensure  => 'installed',
}

class { 'apache': }

apache::dotconf { 'custom':
  content => 'EnableSendfile Off',
}

apache::module { 'rewrite': }

apache::vhost { 'localhost':
  server_name   => 'localhost',
  serveraliases => [
],
  docroot       => '/vagrant/public',
  port          => '80',
  env_variables => [
],
  priority      => '1',
}

class { 'php':
  service             => 'apache',
  service_autorestart => false,
  module_prefix       => '',
}

php::module { 'php5-mysql': }
php::module { 'php5-cli': }
php::module { 'php5-curl': }
php::module { 'php5-intl': }
php::module { 'php5-mcrypt': }

class { 'php::devel':
  require => Class['php'],
}

class { 'php::pear':
  require => Class['php'],
}



$xhprofPath = '/var/www/xhprof'

php::pecl::module { 'xhprof':
  use_package     => false,
  preferred_state => 'beta',
}

if !defined(Package['git-core']) {
  package { 'git-core' : }
}

vcsrepo { $xhprofPath:
  ensure   => present,
  provider => git,
  source   => 'https://github.com/facebook/xhprof.git',
  require  => Package['git-core']
}

file { "${xhprofPath}/xhprof_html":
  ensure  => 'directory',
  owner   => 'vagrant',
  group   => 'vagrant',
  mode    => '0775',
  require => Vcsrepo[$xhprofPath]
}

composer::run { 'xhprof-composer-run':
  path    => $xhprofPath,
  require => [
    Class['composer'],
    File["${xhprofPath}/xhprof_html"]
  ]
}

apache::vhost { 'xhprof':
  server_name => 'xhprof',
  docroot     => "${xhprofPath}/xhprof_html",
  port        => 80,
  priority    => '1',
  require     => [
    Php::Pecl::Module['xhprof'],
    File["${xhprofPath}/xhprof_html"]
  ]
}


class { 'xdebug':
  service => 'apache',
}

class { 'composer':
  require => Package['php5', 'curl'],
}

puphpet::ini { 'xdebug':
  value   => [
    'xdebug.default_enable = 1',
    'xdebug.remote_autostart = 0',
    'xdebug.remote_connect_back = 1',
    'xdebug.remote_enable = 1',
    'xdebug.remote_handler = "dbgp"',
    'xdebug.remote_port = 9000'
  ],
  ini     => '/etc/php5/conf.d/zzz_xdebug.ini',
  notify  => Service['apache'],
  require => Class['php'],
}

puphpet::ini { 'php':
  value   => [
    'date.timezone = "America/Chicago"'
  ],
  ini     => '/etc/php5/conf.d/zzz_php.ini',
  notify  => Service['apache'],
  require => Class['php'],
}

puphpet::ini { 'custom':
  value   => [
    'display_errors = On',
    'error_reporting = -1'
  ],
  ini     => '/etc/php5/conf.d/zzz_custom.ini',
  notify  => Service['apache'],
  require => Class['php'],
}


class { 'mysql::server':
  config_hash   => { 'root_password' => 'root' }
}

mysql::db { 'blitzaroo':
  grant    => [
    'ALL'
  ],
  user     => 'blitzaroo',
  password => 'blitzaroo',
  host     => 'localhost',
  sql      => '/vagrant/sql/blitzaroo.sql',
  charset  => 'utf8',
  require  => Class['mysql::server'],
}


