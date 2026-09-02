# 06 — Identity & Security

## Managed Identity + Azure RBAC + Key Vault

This portfolio entry documents the verified Azure identity/security workflow, including screenshots. The VM managed identity and Key Vault RBAC assignment are complete; the administrator's secret-creation attempt is currently blocked by data-plane RBAC and is documented as a troubleshooting item.

### Key resources
- VM: `vm-web-MM`
- Key Vault: `kv-azure-enterprise-mm`
- Resource Group: `rg-azure-enterprise_MM`
- Role assigned to VM: `Key Vault Secrets User`

### Remediation
Assign `Key Vault Secrets Officer` to the administrator at the Key Vault scope, allow RBAC propagation, then create `DemoSecret` with the dummy value `AzureLab-Test-2026`. Keep the VM as `Key Vault Secrets User`.

### Screenshot folder
See `screenshots/` for the 13 attached Azure Portal screenshots.
