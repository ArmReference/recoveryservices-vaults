# Create Recovery Services Vault

This template creates an Recovery Services Vault in Azure

This is a reference template built fromt the API for this resource.

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
StorageAccountName | Yes      | The name of the Azure Storage Account where the templates are stored
ContainerName  | Yes      | The Container inside the Storage Account
SasToken       | Yes      | The Shared Access Signature for the Storage Account

### StorageAccountName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The name of the Azure Storage Account where the templates are stored

### ContainerName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The Container inside the Storage Account

### SasToken

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The Shared Access Signature for the Storage Account

## Outputs

Name | Type | Description
---- | ---- | -----------
vault | object | The Vault Template
protectionPolicy | object | The Protection Policy

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "azuredeploy.json"
    },
    "parameters": {
        "StorageAccountName": {
            "value": ""
        },
        "ContainerName": {
            "value": ""
        },
        "SasToken": {
            "value": ""
        }
    }
}
```

### Command line

#### PowerShell

```powershell
New-AzResourceGroupDeployment -Name <deployment-name> -ResourceGroupName <resource-group-name> -TemplateFile <path-to-template> -TemplateParameterFile <path-to-templateparameter>
```

#### Azure CLI

```text
az group deployment create --name <deployment-name> --resource-group <resource-group-name> --template-file <path-to-template> --parameters @<path-to-templateparameterfile>
```
