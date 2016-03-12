heartbeat.pp


autofailback 
----------------
The auto_failback option determines whether a resource will automatically 
fail back to its "primary" node, or remain on whatever node is serving it 
until that node fails, or an administrator intervenes.
values: on, off, legacy

autojoin
----------------
The autojoin directive enables nodes to join automatically just by communicating 
with the cluster
• none: disables automatic joining.
• other: allows nodes other than ourself who are not listed in ha.cf to join 
  automatically. In other words, our node has to be listed in ha.cf, but 
  other nodes do not.
• any: allows any node to join automatically without being listed in ha.cf, 
  even the current node.

bcast_devices
----------------
cast directive is used to configure which interfaces Heartbeat sends UDP 
broadcast traffic on
values: array of devices (vm0,eth0,etc..)

coredumps
----------------
The coredumps directive tells Heartbeat to do things to enable making core
dumps - should it need to dump core.
  
value can be "true" or "false"

deadping  
----------------
The deadping directive is used to specify how quickly Heartbeat should decide 
that a ping node in a cluster is dead. Setting this value too low will cause 
the system to falsely declare the ping node dead. Setting it too high will delay 
detection of communication failure.

ucast
---------------
The ucast directive configures Heartbeat to communicate over a UDP unicast 
communications link.
values:
ucast: {
  dev => 'eth0'
  peer_ip => 192.168.1.2
}

mcast
---------------
The mcast directive is used to configure a multicast communication path.
value:
mcast: {
  dev => 'eth0',
  peer_ip => '192.168.1.2',
  udp_port => '694',
  ttl => '1',
}


haresource.pp
----------
hash to create the haresources file in heartbeat
node1.com {
  comment:
    resource: IPaddr2

License
-------


Contact
-------


Support
-------

Please log tickets and issues at our [Projects site](http://projects.example.com)
