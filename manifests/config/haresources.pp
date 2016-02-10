class heartbeat::config::haresources inherits heartbeat {
  file { '/etc/ha.d/haresources':
    ensure  => $heartbeat::params::cfg_ensure,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('heartbeat/haresources.erb'),
  }
}
