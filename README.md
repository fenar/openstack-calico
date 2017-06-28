# Openstack-Calico External BGP Route Integration <br>

Openstack Newton with Calico Embedded as Networking Fabric. In order to get external access to VM@Openstack we either manualy create route via a JumpHots or configure V4N-Mikrotik Router (site router) with BGP Peer Setup : <br>

Add following lines to /etc/bird/bird.conf @ bird (Route Reflector) machine <br>
```sh
protocol bgp ExtRouter {
  description "ExtRouter"; 
  local as 64511; 
  neighbor [Mikrotik-Router-IP-Addr] as 64511; 
  multihop; 
  rr client;
  import all;
  export all; 
} 
```
On the Mikrotik Router:<br>
(a) Change the AS number of the router: BGP → Instances, default, AS 64511, Client To Client Reflection ✓. <br>
(b) Add peers: BGP → Peers, Add New, Name "calico-bird", Remote address <bird-ip-addr>, Remote AS 64511, Route Reflect ✓. <br>
    -> Check status: BGP → Peers, note state=established <br>
(c) Deploy VMs on Openstack taht are attached to [calico_subnet]
(d) Check routes: IP → Routes, note for example: [calico_subnet]/24 via <Nova-Compute Mgmt IP Addr>  Marked DAb (Dynamic, Active, bgp). <br>
    -> verify hosts on the work subnet can ping 192.168.[v4n#+3].0/24 network <br>
