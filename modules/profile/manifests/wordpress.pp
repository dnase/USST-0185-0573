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
  apache::vhost { $::fqdn:
    port     => '80',
    priority => '00',
    docroot  => '/opt/wordpress',
  }
  class { '::wordpress':
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    require     => Class['apache'],
  }
}
