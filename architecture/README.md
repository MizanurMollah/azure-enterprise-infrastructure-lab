# Architecture

Place the final architecture diagram here as:

`azure-architecture.png`

Recommended diagram components:

Internet
  |
Azure VNet (10.10.0.0/16)
  |-- App subnet (10.10.1.0/24) --> VM
  |-- Data subnet (10.10.2.0/24) --> Azure SQL
  |
NSG --> network filtering

Shared services:
- Storage Account
- Key Vault
- Log Analytics
- Azure Monitor / Alerts
- Recovery Services Vault

Governance:
- Azure Policy
- Resource Locks
- Cost Management
- RBAC / Microsoft Entra ID
