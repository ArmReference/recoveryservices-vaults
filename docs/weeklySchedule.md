# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
daysOfTheWeek  | Yes      |
retentionDuration | Yes      | Retention duration of retention policy.
retentionTimes | Yes      |

### daysOfTheWeek

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)



### retentionDuration

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Retention duration of retention policy.

### retentionTimes

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)



## Outputs

Name | Type | Description
---- | ---- | -----------
weeklySchedule | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/weeklySchedule.json"
    },
    "parameters": {
        "daysOfTheWeek": {
            "value": []
        },
        "retentionDuration": {
            "value": {}
        },
        "retentionTimes": {
            "value": []
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
