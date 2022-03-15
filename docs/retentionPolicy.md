# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
dailySchedule  | No       | Daily retention schedule of the backup policy.
monthlySchedule | No       | Monthly retention schedule of the backup policy.
retentionPolicyType | Yes      | This property is used as the discriminator for deciding the specific types in the polymorhpic chain of types.
retentionDuration | No       | Retention duration of the protection policy.
weeklySchedule | No       | Weekly retention schedule of the backup policy.
yearlySchedule | No       | Yearly retention schedule of the backup policy.

### dailySchedule

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Daily retention schedule of the backup policy.

### monthlySchedule

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Monthly retention schedule of the backup policy.

### retentionPolicyType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

This property is used as the discriminator for deciding the specific types in the polymorhpic chain of types.

- Allowed values: `LongTermRetentionPolicy`, `SimpleRetentionPolicy`

### retentionDuration

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Retention duration of the protection policy.

### weeklySchedule

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Weekly retention schedule of the backup policy.

### yearlySchedule

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Yearly retention schedule of the backup policy.

## Outputs

Name | Type | Description
---- | ---- | -----------
retentionPolicy | object | Retention policy with the details on backup copy retention ranges.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/retentionPolicy.json"
    },
    "parameters": {
        "dailySchedule": {
            "value": {}
        },
        "monthlySchedule": {
            "value": {}
        },
        "retentionPolicyType": {
            "value": ""
        },
        "retentionDuration": {
            "value": {}
        },
        "weeklySchedule": {
            "value": {}
        },
        "yearlySchedule": {
            "value": {}
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
