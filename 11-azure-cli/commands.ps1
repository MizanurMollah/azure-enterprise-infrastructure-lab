# Azure Enterprise Infrastructure Lab — Task 11
$subscription = "My Test Azure subscription 1"
$resourceGroup = "rg-azure-enterprise_MM"

az version
az account show --output table
az account list --output table
az account set --subscription $subscription
az account show --output table

az group list --output table
az group show --name $resourceGroup --output table
az resource list --resource-group $resourceGroup --output table

az network vnet list --resource-group $resourceGroup --output table
az network vnet subnet list --resource-group $resourceGroup --vnet-name "vnet-azure-enterprise-MM" --output table
az network nsg list --resource-group $resourceGroup --output table

az storage account list --resource-group $resourceGroup --output table
az vm list --resource-group $resourceGroup --output table

# Cleanup — do not run unless the entire resource group is disposable
# az group delete --name $resourceGroup
