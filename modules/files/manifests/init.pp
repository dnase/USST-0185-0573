class files {
  file { ['/etc/cron.allow', '/etc/cron.deny', '/etc/motd']:
    ensure => file,
  }
  file_line { 'root cron':
    ensure  => present,
    path    => '/etc/cron.allow',
    line    => 'root',
  }
  file_line { 'non-root cron':
    ensure  => present,
    path    => '/etc/cron.deny',
    line    => '*',
  }
  concat { '/etc/motd':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
  concat::fragment { 'motd header':
    target  => '/etc/motd',
    order   => '01',
    content => "Check out this awesome header, yo!\n",
  }
  concat::fragment { 'motd message':
    target  => '/etc/motd',
    order   => '02',
    content => "This is the message of the day.\n",
  }
}
