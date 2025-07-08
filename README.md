<h1 align="center">
Homelab Documentation and Automation
</h1>

# Overview

A complete documentation guide of my progress building a (third) homelab over the last couple of years. This includes configuration and architeture diagrams, some explanation, and serves as a portfolio for the infrastructure jobs.

# Goals and High-Level Components

I put several goals in place when rebuilding this lab from the ground-up, including
- Full control of networking out to my home (edge) router.
- Network Segmentation
- Kubernetes Deployment
- Configuration Management through something like Nix or Ansible
- Automated personal configurations (Nix, Ansible, Chezmoi)
- Documentation of Effort (this document)

From there, needs drove the rest. I started out initially with my Plex Server, which was the foundation of this effort, and slowly expanded the stack, services, and hardware involved.

## Components

- Plex Media Server
	- Ubuntu
	- [Beelink EQi12](https://www.amazon.com/dp/B0B9JRT7Q9) 
		- Upgraded with a Samsung 990 Pro 1TB for incomplete downloads
- Kubernetes Cluster
	- 3x Beelink EQi12s
	- 1 control node, 2 worker nodes.

