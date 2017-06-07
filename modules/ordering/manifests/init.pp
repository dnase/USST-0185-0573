class ordering {
  include ordering::mysql

  notify { 'This should come after the mysql class':
    require => Class['ordering::mysql'],
  }
}
