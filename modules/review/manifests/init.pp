class review (
  $user = 'review'
) {
  $homedir = $user ? {
    'root'  => '/root',
    default => "/home/${user}",
  }
  user { $user:
    ensure     => present,
    home       => $homedir,
    managehome => true,
  }
  file { "${homedir}/.bashrc":
    ensure => present,
  }
  service { 'puppet':
    ensure => stopped,
  }
}
