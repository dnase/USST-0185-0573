class profile::splunk::server {
  class { 'splunk':
    deploy            => 'server',
    splunk_admin      => 'drewbilee',
    splunk_admin_pass => hiera('splunkpass', 'puppetlabs'),
  }
}
