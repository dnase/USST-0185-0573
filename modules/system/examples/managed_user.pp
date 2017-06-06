$password = '$1$Cu7bUZXY$4dKBug.jULFAihygVvHOj0'

system::managed_user { ['drewbilee', 'trevor', 'brin', 'zwe']:
  password => $password,
}
