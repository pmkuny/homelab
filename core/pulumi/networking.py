import pulumi 
import pulumi_aws as aws

'''
VPC: 10.0.0.0/21

# Control plane subnets
Subnet 1 - Control Plane AZ-a: 10.0.1.0/27   (27 usable IPs)
Subnet 2 - Control Plane AZ-b: 10.0.2.0/27   (27 usable IPs)

# Worker node subnets
Subnet 3 - Workers AZ-a: 10.0.3.0/25   (123 usable IPs)
Subnet 4 - Workers AZ-b: 10.0.4.0/25   (123 usable IPs)
'''

class KubernetesNetworkingStack(pulumi.ComponentResource):
    def __init__(self, name: str, my_cidr: dict, opts: pulumi.ResourceOptions = None):
        super().__init__("custom:networking:KubernetesNetworkingStack", name, {}, opts)

        self.kubernetes_vpc = aws.ec2.Vpc("kubernetes-vpc",
            cidr_block=my_cidr["vpc"]
            enable_dns_hostnames=True,
            enable_dns_support=True,
            opts=pulumi.ResourceOptions(parent=self))

