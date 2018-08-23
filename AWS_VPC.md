###     Steps necessary to create a private VPC.

1. Create VPC with CIDR assigned.

2. Create `subnet` that will be a part of  VPC created. AZ (Availability Zones) and CIDR of subnet should be also defined.

3. Create `route table` associated with VPC. Each VPC has a default route table wich is automatically associated with each subnet we are creating. Route table = Implied router!

4. The next step is to link subnet to route table (subnet association).

5. Create internet gateway and attach it to VPC.

6. Route table, add another route, write default route to gw.

7.  Creating `security group` associated with VPC.

8. For Elastic IP we should do next:

   8.1. Create Network interface associated with subnet and security groups.

   8.2. Allocate elastic ip address.

   8.3. Assosiate elastic ip address with network interface and private ip address.

9. Create instance as usual.

   

###     Steps necessary to create a private VPC.

1. Create private VPC.
2. Create subnet associated with VPC.
3. Create route table and associate with VPC.
4. Associate subnet with route table.
5. Create instance as usual with defining  SG to instance with ports needed!!!



### Steps to get peering connection

1. Create peering connection with VPC (requester) - webVPC, accepter - dbVPC. Then we should accept request from dbVPC, that because there is an opportunity to peer with a network in another account.
2. Add routes to route tables of both networks. Good practice to add route to VPC, not to subnet.
3. Just note! VPC Peering can be used on within on region, there is another option to peer VPCs across regions, but currently it's not important.
4. Just another note! An instance in one VPC cannot use the IG in a peered VPC



### Giving an access to the internet dbVPC with NAT

1. Create new internet gateway - dbGV.
2. Attach to dbVPC.
3.  Create public subnet.
4. Create new route table associated with dbVPC.
5. Add a new route record to dbGV (in nat-pub RT).
6. Route table associate it with public subnet.



### Creating Bastion

1. Create new ElasticIP
2. Find bastion instance and configure it. Don't forget create security group for instance with ssh, all tcp 10.0.0.0/8.
3. Disable source/destination check? And assign elasticIP.
4. Add default route on public subnet in dbVPC to nat (in shared RT).
