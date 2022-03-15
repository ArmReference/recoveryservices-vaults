# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
schedulePolicyType | Yes      | This property will be used as the discriminator for deciding the specific types in the polymorphic chain of types.
scheduleFrequencyInMins | No       | Frequency of the log schedule operation of this policy in minutes.
scheduleRunDays | No       | List of days of week this schedule has to be run.
scheduleRunFrequency | Yes      | Frequency of the schedule operation of this policy.
scheduleRunTimes | No       | List of times of day this schedule has to be run.
scheduleWeeklyFrequency | No       | At every number weeks this schedule has to be run.

### schedulePolicyType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

This property will be used as the discriminator for deciding the specific types in the polymorphic chain of types.

- Allowed values: `LogSchedulePolicy`, `SimpleSchedulePolicy`, `LongTermSchedulePolicy`

### scheduleFrequencyInMins

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Frequency of the log schedule operation of this policy in minutes.

- Default value: `0`

### scheduleRunDays

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

List of days of week this schedule has to be run.

### scheduleRunFrequency

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Frequency of the schedule operation of this policy.

- Allowed values: `Daily`, `Invalid`, `Weekly`

### scheduleRunTimes

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

List of times of day this schedule has to be run.

### scheduleWeeklyFrequency

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

At every number weeks this schedule has to be run.

- Default value: `0`

## Outputs

Name | Type | Description
---- | ---- | -----------
schedulePolicy | object | Backup schedule specified as part of backup policy.

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/schedulePolicy.json"
    },
    "parameters": {
        "schedulePolicyType": {
            "value": ""
        },
        "scheduleFrequencyInMins": {
            "value": 0
        },
        "scheduleRunDays": {
            "value": []
        },
        "scheduleRunFrequency": {
            "value": ""
        },
        "scheduleRunTimes": {
            "value": []
        },
        "scheduleWeeklyFrequency": {
            "value": 0
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
