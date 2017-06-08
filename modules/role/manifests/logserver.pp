class role::logserver {
  include profile::base
  include profile::base::security
  include profile::base::linux
  include profile::splunk
  include profile::splunk::server
}
