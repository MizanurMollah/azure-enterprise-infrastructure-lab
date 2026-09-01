# 11 — Azure CLI

## Objective
Automate common Azure administration tasks with Azure CLI.

## Login
```bash
az login
az account show
az account list --output table
```

## Resource group
```bash
az group list --output table
az group show --name rg-azlab-prod
```

## Resource discovery
```bash
az resource list --resource-group rg-azlab-prod --output table
```

## Networking
```bash
az network vnet list --resource-group rg-azlab-prod --output table
az network nsg list --resource-group rg-azlab-prod --output table
```

## Storage
```bash
az storage account list --resource-group rg-azlab-prod --output table
```

## Cleanup
Only run deletion commands when you are certain the resource group contains only lab resources.

```bash
az group delete --name rg-azlab-prod
```

## Evidence
Paste terminal screenshots or command output summaries here.

## Interview questions
- Azure CLI vs Azure PowerShell?
- Why automate infrastructure operations?
