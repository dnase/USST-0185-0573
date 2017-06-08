class profile::wordpress {
  # manage apache (webserver)
  require apache
  # manage mysql
  class { '::mysql::server':
    root_password => 'puppetlabs',
  }
  # manage PHP bindings for apache/mysql
  require apache::mod::php
  require mysql::bindings
  require mysql::bindings::php
  # manage a wordpress user
  user { 'wordpress':
    ensure => present,
    gid    => 'wordpress',
  }
  group { 'wordpress':
    ensure => present,
  }
  apache::vhost { $::fqdn:
    port     => '80',
    priority => '00',
    docroot  => '/var/www/html',
  }
  # manage/install wordpress
  class { '::wordpress':
    install_dir => '/var/www/html',
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    require     => Class['apache'],
    db_password => 'puppetlabs',
  }
}
