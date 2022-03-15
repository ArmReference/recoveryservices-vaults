# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
protectedItemType | Yes      | Microsoft.ClassicCompute/virtualMachines, Microsoft.Compute/virtualMachines, AzureIaaSVMProtectedItem, Microsoft.Sql/servers/databases, DPMProtectedItem, MabFileFolderProtectedItem, ProtectedItem
backupManagementType | Yes      | Type of backup managemenent for the backed up item.
workloadType   | Yes      | Type of workload this item represents.
containerName  | Yes      | Unique name of container
sourceResourceId | Yes      | ARM ID of the resource to be backed up.
policyId       | Yes      | ID of the backup policy with which this item is backed up.
DependsOn      | No       | Pass dependencies

### protectedItemType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Microsoft.ClassicCompute/virtualMachines, Microsoft.Compute/virtualMachines, AzureIaaSVMProtectedItem, Microsoft.Sql/servers/databases, DPMProtectedItem, MabFileFolderProtectedItem, ProtectedItem

- Allowed values: `Microsoft.ClassicCompute/virtualMachines`, `Microsoft.Compute/virtualMachines`, `AzureIaaSVMProtectedItem`, `Microsoft.Sql/servers/databases`, `DPMProtectedItem`, `MabFileFolderProtectedItem`, `ProtectedItem`

### backupManagementType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Type of backup managemenent for the backed up item.

- Allowed values: `Invalid`, `AzureIaasVM`, `MAB`, `DPM`, `AzureBackupServer`, `AzureSql`

### workloadType

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Type of workload this item represents.

- Allowed values: `Invalid`, `VM`, `FileFolder`, `AzureSqlDb`, `SQLDB`, `Exchange`, `Sharepoint`, `VMwareVM`, `SystemState`, `Client`, `GenericDataSource`

### containerName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Unique name of container

### sourceResourceId

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

ARM ID of the resource to be backed up.

### policyId

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

ID of the backup policy with which this item is backed up.

### DependsOn

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Pass dependencies

## Outputs

Name | Type | Description
---- | ---- | -----------
protectedItems | object |

## Snippets

### Parameter file

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "metadata": {
        "template": "reference/protectedItems.json"
    },
    "parameters": {
        "protectedItemType": {
            "value": ""
        },
        "backupManagementType": {
            "value": ""
        },
        "workloadType": {
            "value": ""
        },
        "containerName": {
            "value": ""
        },
        "sourceResourceId": {
            "value": ""
        },
        "policyId": {
            "value": ""
        },
        "DependsOn": {
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
