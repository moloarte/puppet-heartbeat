# haresource
# ----------
# hash to create the haresources file in heartbeat
# node1.com {
#   comment:
#     resource: IPaddr2
# 
# autofailback 
# ----------------
# The auto_failback option determines whether a resource will automatically 
# fail back to its "primary" node, or remain on whatever node is serving it 
# until that node fails, or an administrator intervenes.
# values: on, off, legacy
#
# autojoin
# ----------------
# The autojoin directive enables nodes to join automatically just by communicating 
# with the cluster
# • none: disables automatic joining.
# • other: allows nodes other than ourself who are not listed in ha.cf to join 
#   automatically. In other words, our node has to be listed in ha.cf, but 
#   other nodes do not.
# • any: allows any node to join automatically without being listed in ha.cf, 
#   even the current node.
#
# bcast_devices
# ----------------
# cast directive is used to configure which interfaces Heartbeat sends UDP 
# broadcast traffic on
# values: array of devices (vm0,eth0,etc..)
#
# coredumps
# ----------------
# The coredumps directive tells Heartbeat to do things to enable making core
# dumps - should it need to dump core.
#   
# value can be "true" or "false"
#
# deadping  
# ----------------
# The deadping directive is used to specify how quickly Heartbeat should decide 
# that a ping node in a cluster is dead. Setting this value too low will cause 
# the system to falsely declare the ping node dead. Setting it too high will delay 
# detection of communication failure.
#
# ucast
# ---------------
# The ucast directive configures Heartbeat to communicate over a UDP unicast 
# communications link.
# values:
# ucast: {
#   dev => 'eth0'
#   peer_ip => 192.168.1.2
# }
#
# mcast
# ---------------
# The mcast directive is used to configure a multicast communication path.
# value:
# mcast: {
#   dev => 'eth0',
#   peer_ip => '192.168.1.2',
#   udp_port => '694',
#   ttl => '1',
# }
class heartbeat (
  $haresource,
  $node,
  $key,
  $ensure        = $heartbeat::params::pkg_ensure,
  $package       = $heartbeat::params::package,
  $autojoin      = $heartbeat::params::autojoin,
  $keepalive     = $heartbeat::params::keepalive,
  $warntime      = $heartbeat::params::warntime,
  $deadtime      = $heartbeat::params::deadtime,
  $initdead      = $heartbeat::params::initdead,
  $use_logd      = $heartbeat::params::use_logd,
  $coredumps     = $heartbeat::params::coredumps,
  $deadping      = $heartbeat::params::deadping,
  $ping          = $heartbeat::params::ping,
  $autofailback  = $heartbeat::params::autofailback,
  $bcast_devices = $heartbeat::params::bcast_devices,
  $logfacility   = $heartbeat::params::logfacility,
  $logfile       = $heartbeat::params::logfile,
  $udpport       = $heartbeat::params::udpport,
  $ucast         = $heartbeat::params::ucast,
  $mcast         = $heartbeat::params::mcast,
  $mcast6        = $heartbeat::params::mcast6,
  $debug         = $heartbeat::params::debug,
  $debugfile     = $heartbeat::params::debugfile,

) inherits heartbeat::params {
  include heartbeat::config::config
  include heartbeat::config::haresources
  include heartbeat::config::auth

  package { $package :
    ensure => $ensure,
    before => Service[$package]
  }
  service { $package:
    ensure  => running,
  }

  Package[$package] ~>
  Class['heartbeat::config::auth'] ~>
  Class['heartbeat::config::config'] ~>
  Class['heartbeat::config::haresources'] ~>
  Service[$package]
}

