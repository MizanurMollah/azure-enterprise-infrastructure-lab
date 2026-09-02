param(
  [Parameter(Mandatory=$true)][string]$ResourceGroup,
  [string]$TemplateFile = "main.bicep"
)

az account show --output table
az group show --name $ResourceGroup --output table
az bicep version
az deployment group what-if --resource-group $ResourceGroup --template-file $TemplateFile
az deployment group create --resource-group $ResourceGroup --template-file $TemplateFile
