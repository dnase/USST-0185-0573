define system::managed_user (
  $username = $title,
  $password,
) {
  user { $username:
    ensure     => present,
    password   => $password,
    home       => "/home/${username}",
    managehome => true,
  }
  if $::kernel == 'Linux' {
    file { "/home/${username}/.bashrc":
      ensure => file,
      owner  => $username,
      mode   => '0644',
      source => 'puppet:///modules/system/bashrc',
    }
  }
}
