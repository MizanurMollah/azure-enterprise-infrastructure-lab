# 12 — Azure Bicep

## Scope
This portfolio item documents the uploaded `main.bicep` template.

## Resources
- `nsg-app`
- `vnet-azlab-prod` (`10.10.0.0/16`)
- `snet-app` (`10.10.1.0/24`) with `nsg-app`
- `snet-data` (`10.10.2.0/24`)

## Outputs
- `vnetId`
- `appSubnetId`

## Deployment
```bash
az deployment group what-if --resource-group <resource-group-name> --template-file main.bicep
az deployment group create --resource-group <resource-group-name> --template-file main.bicep
```

Actual Azure deployment screenshots/output were not included with the uploaded Bicep file, so validation evidence should be captured after deployment.
