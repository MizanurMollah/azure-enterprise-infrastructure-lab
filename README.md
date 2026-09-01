# Azure Enterprise Infrastructure Lab

A hands-on Azure portfolio project designed to demonstrate enterprise-style cloud administration, networking, security, monitoring, governance, backup, cost management, Azure CLI and Bicep.

> **Goal:** Build the lab step-by-step in Azure, document the configuration with screenshots, and publish the evidence on GitHub and LinkedIn.

## Project outcomes

- Resource organization, naming and tagging
- Azure Virtual Network, subnets and NSGs
- Windows/Linux virtual machine administration
- Storage account and blob storage
- Azure SQL Database
- Microsoft Entra ID, RBAC and Key Vault
- Azure Monitor, Log Analytics and alerts
- Azure Backup
- Azure Policy and resource locks
- Cost Management and budgets
- Azure CLI automation
- Infrastructure as Code with Bicep

## Recommended naming convention

Use a consistent prefix such as:

`azlab-<service>-<purpose>-<environment>`

Example:

- Resource group: `rg-azlab-prod`
- VNet: `vnet-azlab-prod`
- Subnet: `snet-app`
- NSG: `nsg-app`
- Storage: use a globally unique lowercase name such as `stazlab<unique>`
- Key Vault: use a globally unique name such as `kv-azlab-<unique>`

## Cost safety

This lab is intended for an Azure free-credit subscription. Do not leave chargeable resources running when you are not using them.

Before creating resources:
1. Create a budget alert.
2. Use the smallest suitable VM size.
3. Stop/deallocate the VM after practice.
4. Delete resources that are no longer required.
5. Check Cost Management regularly.

## Repository structure

See the folders in this repository. Each module contains a short assessment and documentation template.

## Evidence standard

For each module, capture:
- Azure portal screenshot showing the final configuration
- 2–5 bullet explanation of what was configured
- Why the configuration matters in an enterprise environment
- Any issue encountered and how it was solved

Never commit passwords, secrets, access keys, private keys, connection strings or personal tokens.

## Suggested completion order

1. Resource Management
2. Networking
3. Virtual Machine
4. Storage
5. Azure SQL
6. Identity & Security
7. Monitoring
8. Backup
9. Governance
10. Cost Management
11. Azure CLI
12. Bicep
