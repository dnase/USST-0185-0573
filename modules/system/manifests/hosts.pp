class system::hosts {
  resources { 'host':
    purge => true,
  }
  #host { 'dnase.puppetlabs.vm':
  #  ensure       => 'present',
  #  host_aliases => ['dnase'],
  #  ip           => '10.0.42.27',
  #}
  host { 'localhost':
    ensure       => 'present',
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
    ip           => '::1',
  }
  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['master'],
    ip           => '10.0.42.21',
  }
  host { 'student.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['student', 'localhost', 'localhost.localdomain', 'localhost4'],
    ip           => '127.0.0.1',
  }
}
