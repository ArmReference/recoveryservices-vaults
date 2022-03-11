# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
count          | Yes      | Count of the duration types. Retention duration is determined by the combining the Count times and durationType. For example, if Count = 3 and durationType = Weeks, then the retention duration is three weeks.
durationType   | Yes      | The retention duration type of the retention policy.

### count

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Count of the duration types. Retention duration is determined by the combining the Count times and durationType. For example, if Count = 3 and durationType = Weeks, then the retention duration is three weeks.

### durationType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The retention duration type of the retention policy.

- Allowed values: `Days`, `Invalid`, `Months`, `Weeks`, `Years`

## Outputs

Name | Type | Description
---- | ---- | -----------
retentionDuration | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/retentionDuration.json"
    },
    "parameters": {
        "count": {
            "value": 0
        },
        "durationType": {
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
