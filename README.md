fmvsrr
===

A Maintenance and Configuration Cost Calculator for iBGP setups

A comparison of BGP as iGP with next-hop-self in a fully connected mesh vs BGP as iGP with next-hop-self
with two Route Reflectors.

This is an effort to point the obvious,
quantify he best of the two setups in terms of configuration and maintenance cost
and it is inspired by a quest in the AWMN mailing list to find the best intraAS setup for AWMN nodes with many routers .


( AWMN is a wireless BGP internet where each wireless node has an Autonomous System Number and 1 to 15 routers with wireless interfaces. The routing within each node is done with static Routes or some iGP --usually OSPF-- or iBGP with next-hop-self. )


We assume that:

The maintenance cost is equal to the number of iBGP sessions --the number of connections in the mesh.

The total configuration cost is equal to the number of (neighbor) configuration stanzas for all iBGP connections.

The cost of adding a router is equal to the number of (neighbor) iBGP configuration stanzas needed in all the nodes in the mesh.


![discription](https://github.com/ipduh/fmvsrr/blob/master/full_mesh_vs_rr.gif)





<br />

more at http://alog.ipduh.com/2014/12/bgp-as-igp-with-next-hop-self-rr-vs.html
