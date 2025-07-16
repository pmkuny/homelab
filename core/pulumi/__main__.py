"""A Python Pulumi program"""

import pulumi
import pulumi_aws as aws
from networking import KubernetesNetworkingStack

account_tags = {}
kubernetes_network_cidr = {
    "vpc": "10.0.0.0/21",
    "control_plane_1": "10.0.1.0/27",
    "control_plane_2": "10.0.2.0/27",
    "worker_plane_1": "10.0.3.0/25",
    "worker_plane_2": "10.0.4.0/25"
}

network_stack = KubernetesNetworkingStack("dev-cluster-network",kubernetes_network_cidr)

