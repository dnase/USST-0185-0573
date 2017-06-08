class profile::wordpress {
  require ::apache
  require ::apache::mod::php
  require ::mysql::server
  require ::mysql::bindings
  require ::mysql::bindings::php

  user { 'wordpress':
    ensure => present,
    gid    => 'wordpress',
  }
  group { 'wordpress':
    ensure => present,
  }
  class { '::wordpress':
    install_dir => '/var/www/html',
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    require     => Class['apache'],
  }
}
