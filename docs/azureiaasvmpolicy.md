# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
azureBackupRGNamePrefix | No       | Prefix to apply to a ResourceGroup for backups
azureBackupRGNameSuffix | No       | Suffix to apply to a ResourceGroup for backups
instantRpRetentionRangeInDays | No       | Instant RP retention policy range in days
policyType     | No       | Type of backup policy type
retentionPolicyType | No       | Type of backup policy type
schedulePolicyType | No       | Type of backup policy type

### azureBackupRGNamePrefix

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Prefix to apply to a ResourceGroup for backups

### azureBackupRGNameSuffix

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Suffix to apply to a ResourceGroup for backups

### instantRpRetentionRangeInDays

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Instant RP retention policy range in days

- Default value: `2`

### policyType

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Type of backup policy type

- Default value: `Full`

- Allowed values: `CopyOnlyFull`, `Differential`, `Full`, `Incremental`, `Invalid`, `Log`

### retentionPolicyType

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Type of backup policy type

- Default value: `SimpleRetentionPolicy`

- Allowed values: `LongTermRetentionPolicy`, `SimpleRetentionPolicy`

### schedulePolicyType

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Type of backup policy type

- Default value: `SimpleSchedulePolicy`

- Allowed values: `LogSchedulePolicy`, `LongTermSchedulePolicy`, `SimpleSchedulePolicy`, `SimpleSchedulePolicyV2`

## Outputs

Name | Type | Description
---- | ---- | -----------
protectionPolicy | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.1",
    "metadata": {
        "template": "reference/azureiaasvmpolicy.json"
    },
    "parameters": {
        "azureBackupRGNamePrefix": {
            "value": ""
        },
        "azureBackupRGNameSuffix": {
            "value": ""
        },
        "instantRpRetentionRangeInDays": {
            "value": 2
        },
        "policyType": {
            "value": "Full"
        },
        "retentionPolicyType": {
            "value": "SimpleRetentionPolicy"
        },
        "schedulePolicyType": {
            "value": "SimpleSchedulePolicy"
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
