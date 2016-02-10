class heartbeat::config::auth inherits heartbeat {
  file { '/etc/ha.d/authkeys':
    ensure  => $heartbeat::params::ensure,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    content => template('heartbeat/auth_key.erb'),
  }
}
