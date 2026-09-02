# Task 02 — Azure Virtual Network (VNet)

## Project
**Enterprise Azure Infrastructure, Security & Monitoring Lab**

## Objective
Create a segmented Azure Virtual Network for future web, database, and management workloads.

## Configuration

| Setting | Value |
|---|---|
| Subscription | My Test Azure subscription 1 |
| Resource Group | `rg-azure-enterprise_MM` |
| Region | Central India |
| VNet Name | `vnet-azure-enterprise-MM` |
| Address Space | `10.0.0.0/16` |

## Subnets

| Subnet | Address Range | Purpose |
|---|---|---|
| `WebSubnet_MM` | `10.0.1.0/24` | Web/application workload |
| `DatabaseSubnet_MM` | `10.0.2.0/24` | Database workload |
| `ManagementSubnet_MM` | `10.0.3.0/24` | Administration/management |

## Architecture

```text
Azure Subscription
       |
       v
rg-azure-enterprise_MM
       |
       v
vnet-azure-enterprise-MM
10.0.0.0/16
       |
       +-------------------+-------------------+
       |                   |                   |
       v                   v                   v
WebSubnet_MM        DatabaseSubnet_MM   ManagementSubnet_MM
10.0.1.0/24         10.0.2.0/24         10.0.3.0/24
```

## Design Rationale

The VNet is the overall network boundary. Separate subnets provide logical network segmentation so different workloads can later receive different security and routing controls.

Azure Bastion, Azure Firewall, and Azure DDoS Network Protection were left disabled for this learning lab. No NAT Gateway or NSG was attached during initial subnet creation; NSG configuration is the next dedicated task.

## What I Learned

- A VNet provides private networking for Azure resources.
- A subnet is a logical subdivision of a VNet address space.
- The VNet uses `10.0.0.0/16`.
- The three subnets use non-overlapping `/24` ranges.
- Network segmentation helps separate workloads and apply different security controls.
- NSGs can later control network traffic at the subnet or network-interface level.

## Interview Questions

### Q1. What is an Azure VNet?
An Azure Virtual Network is a private network boundary in Azure that enables IP-based communication between Azure resources and supported connected networks.

### Q2. What is a subnet?
A subnet is a logical subdivision of a VNet's IP address space.

### Q3. Why use multiple subnets?
To logically separate workloads and apply different security, routing, and access controls.

### Q4. What does `10.0.0.0/16` mean?
It is the IPv4 address space allocated to the VNet from which subnet ranges are created.

### Q5. Why use `/24` subnets?
They provide a practical, manageable subnet size for this learning lab while leaving address space available for future subnets.

### Q6. Can two VNets communicate automatically?
No. VNets are isolated by default. Connectivity requires an appropriate mechanism such as VNet peering or VPN connectivity.

## Evidence

The attached screenshot shows the Azure deployment succeeded for `vnet-azure-enterprise-MM` in `rg-azure-enterprise_MM`, with the virtual network resource in **Created** status.

## Result

**Task 02 completed successfully.**

The Azure portfolio now has a segmented VNet ready for network security configuration.

## Next Task

**Task 03 — Network Security Groups (NSG)**

Topics:
- Inbound and outbound rules
- TCP/UDP ports
- Source and destination
- Rule priority
- Allow/Deny behavior
- Subnet-level security
- Web/database/management segmentation
