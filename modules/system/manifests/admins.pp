class system::admins {
  require mysql::server
  $users = {
    'zack'   => {
      max_queries_per_hour => 1200,
    },
    'monica' => {},
    'ralph'  => {
      ensure => absent,
    },
    'brad'   => {},
    'luke'   => {},
  }

  $users.each |$user, $data| {
    mysql_user { "$user@localhost":
      ensure               => pick($data['ensure'], 'present'),
      max_queries_per_hour => pick($data['max_queries_per_hour'], 600),
    }
    user { $user:
      ensure => pick($data['ensure'], 'present'),
    }
  }
}
