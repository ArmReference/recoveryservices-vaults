# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
daysOfTheWeek  | Yes      | List of days of the week.
weeksOfTheMonth | Yes      | List of weeks of month.

### daysOfTheWeek

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

List of days of the week.

### weeksOfTheMonth

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

List of weeks of month.

## Outputs

Name | Type | Description
---- | ---- | -----------
retentionScheduleWeekly | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/retentionScheduleWeekly.json"
    },
    "parameters": {
        "daysOfTheWeek": {
            "value": []
        },
        "weeksOfTheMonth": {
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
