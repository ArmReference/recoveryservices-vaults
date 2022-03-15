# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
policyType     | Yes      | Type of backup policy type
retentionPolicy | Yes      | The retention policy with the details on backup copy retention ranges.
schedulePolicy | Yes      | The backup schedule specified as part of backup policy.

### policyType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Type of backup policy type

- Allowed values: `CopyOnlyFull`, `Differential`, `Full`, `Incremental`, `Invalid`, `Log`

### retentionPolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The retention policy with the details on backup copy retention ranges.

### schedulePolicy

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

The backup schedule specified as part of backup policy.

## Outputs

Name | Type | Description
---- | ---- | -----------
subProtectionPolicy | object | List of sub-protection policies which includes schedule and retention

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/subprotectionpolicy.json"
    },
    "parameters": {
        "policyType": {
            "value": ""
        },
        "retentionPolicy": {
            "value": {}
        },
        "schedulePolicy": {
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
