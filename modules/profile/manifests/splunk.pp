class profile::splunk {
  class { '::splunk':
    logging_server => hiera('splunkserver')
  }
}
