class heartbeat::params {

  # module parameters

  $package    = 'heartbeat'
  $pkg_ensure = 'installed'
  $cfg_ensure = $pkg_ensure ? {
    'absent' => 'absent',
    default  => 'present',
  }

  # ha.cf parameters
  
  $autojoin      = undef
  $keepalive     = undef
  $warntime      = undef
  $deadtime      = undef
  $initdead      = undef
  $use_logd      = undef
  $coredumps     = undef
  $deadping      = undef
  $ping          = undef
  $autofailback  = 'on'
  $bcast_devices = undef
  $logfacility   = undef
  $logfile       = '/var/log/heartbeat.log'
  $udpport       = '694'
  $ucast         = undef
  $mcast         = undef
  $mcast6        = undef
  $debug         = undef
  $debugfile     = undef
}
