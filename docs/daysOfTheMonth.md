# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
date           | Yes      | Date of the month
isLast         | No       | Whether Date is last date of month

### date

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Date of the month

### isLast

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Whether Date is last date of month

- Default value: `False`

## Outputs

Name | Type | Description
---- | ---- | -----------
daysOfTheMonth | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/daysOfTheMonth.json"
    },
    "parameters": {
        "date": {
            "value": 0
        },
        "isLast": {
            "value": false
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
