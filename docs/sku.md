# Azure template

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
name           | No       | The sku name.
capacity       | No       | The sku capacity.
family         | No       | The sku family.
size           | No       | The sku size.
tier           | No       | The sku tier.

### name

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The sku name.

- Default value: `RS0`

- Allowed values: `RS0`, `Standard`

### capacity

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The sku capacity.

### family

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The sku family.

### size

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The sku size.

### tier

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

The sku tier.

## Outputs

Name | Type | Description
---- | ---- | -----------
sku  | object | Identifies the unique system identifier for each Azure resource.

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
        "capacity": {
            "value": ""
        },
        "family": {
            "value": ""
        },
        "size": {
            "value": ""
        },
        "tier": {
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
