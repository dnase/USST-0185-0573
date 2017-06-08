class profile::proxy {
  @@haproxy::balancermember { "capstone_$::fqdn":
    listening_service => 'web00',
    server_name       => $::hostname,
    ipaddresses       => $::ipaddress,
    options           => 'check',
    ports             => '80',
  }
}
