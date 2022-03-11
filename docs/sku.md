# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | No       | The sku name.
tier           | No       | The sku tier.

### name

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The sku name.

- Default value: `RS0`

- Allowed values: `RS0`

### tier

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The sku tier.

- Default value: `Standard`

- Allowed values: `Standard`

## Outputs

Name | Type | Description
---- | ---- | -----------
sku  | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/sku.json"
    },
    "parameters": {
        "name": {
            "value": "RS0"
        },
        "tier": {
            "value": "Standard"
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
