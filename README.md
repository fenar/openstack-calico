# openstack-calico external BGP Route integration <br>

Openstack Newton with Calico Embedded as Networking Fabric <br>
In order to get V4N-Mikrotik Router BGP Setup : <br>

Add following lines to /etc/bird/bird.conf @ bird machine <br>
protocol bgp ExtRouter { <br>
  description "ExtRouter"; <br>
  local as 64511; <br>
  neighbor 172.27.141.254 as 64511; <br>
  multihop; <br>
  rr client; <br>
  import all; <br>
  export all; <br>
} <br>

On the Mikrotik Router:<br>
(a) Change the AS number of the router: BGP → Instances, default, AS 64511, Client To Client Reflection ✓. <br>
(b) Add peers: BGP → Peers, Add New, Name "calico-bird", Remote address <bird-ip-addr>, Remote AS 64511, Route Reflect ✓. <br>
    -> Check status: BGP → Peers, note state=established <br>
(c) Check routes: IP → Routes, note for example: 192.168.143.100/24 via 172.27.140.X  Marked DAb (Dynamic, Active, bgp). <br>
    verify hosts on the work subnet can ping 192.168.143.0/24 network <br>
