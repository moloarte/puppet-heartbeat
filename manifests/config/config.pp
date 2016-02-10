class heartbeat::config::config  inherits heartbeat {
  file { '/etc/ha.d/ha.cf':
    ensure  => $heartbeat::params::cfg_ensure,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('heartbeat/config.erb'),
  }
}

