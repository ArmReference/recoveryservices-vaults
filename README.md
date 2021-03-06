# recoveryservices-vaults
Reference deployment
```
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "StorageAccountName": {
      "type": "string"
    },
    "ContainerName": {
      "type": "string"
    },
    "SasToken": {
      "type": "string"
    }
  },
  "variables": {
    "Provider": "/Microsoft.RecoveryServices",
    "Resource": "/vaults",
    "templateUri": "[concat('https://',parameters('StorageAccountName'),'.blob.core.windows.net/',parameters('ContainerName'),variables('Provider'),variables('Resource'))]"

  },
  "resources": [
    {
      "name": "BuildSKU",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/sku.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "name": {
            "value": "RS0"
          },
          "tier": {
            "value": "Standard"
          }
        }
      }
    },
    {
      "name": "BuildRecoveryServicesVault",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','BuildSKU')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/vaults.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "name": {
            "value": "RSV-01"
          },
          "sku": {
            "value": "[reference('BuildSKU').outputs.sku.value]"
          },
          "tags": {
            "value": "[json('{\"TagName\": \"TagValue\"}')]"
          }
        }
      }
    },
    {
      "name": "DefineDailyRetentionDuration",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/retentionDuration.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "count": {
            "value": 15
          },
          "durationType": {
            "value": "Days"
          }
        }
      }
    },
    {
      "name": "DefineDailySchedulePolicy",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','DefineDailyRetentionDuration')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/dailySchedule.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "retentionDuration": {
            "value": "[reference('DefineDailyRetentionDuration').outputs.retentionDuration.value]"
          },
          "retentionTimes": {
            "value": "[createArray('02:30')]"
          }
        }
      }
    },
    {
      "name": "DefineWeeklyRetentionDuration",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/retentionDuration.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "count": {
            "value": 7
          },
          "durationType": {
            "value": "Weeks"
          }
        }
      }
    },
    {
      "name": "DefineWeeklySchedulePolicy",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','DefineWeeklyRetentionDuration')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/weeklySchedule.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "daysOfTheWeek": {
            "value": "[createArray('Sunday')]"
          },
          "retentionDuration": {
            "value": "[reference('DefineWeeklyRetentionDuration').outputs.retentionDuration.value]"
          },
          "retentionTimes": {
            "value": "[createArray('02:30')]"
          }
        }
      }
    },
    {
      "name": "DefineMonthlyRetentionDuration",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/retentionDuration.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "count": {
            "value": 120
          },
          "durationType": {
            "value": "Months"
          }
        }
      }
    },
    {
      "name": "DefineWeeklyRetentionSchedule",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/retentionScheduleWeekly.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "daysOfTheWeek": {
            "value": "[createArray('Sunday')]"
          },
          "weeksOfTheMonth": {
            "value": "[createArray('First')]"
          }
        }
      }
    },
    {
      "name": "DefineMonthlySchedulePolicy",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','DefineMonthlyRetentionDuration')]",
        "[concat('Microsoft.Resources/deployments/','DefineWeeklyRetentionSchedule')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/monthlySchedule.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "retentionDuration": {
            "value": "[reference('DefineMonthlyRetentionDuration').outputs.retentionDuration.value]"
          },
          "retentionScheduleDaily": {
            "value": {}
          },
          "retentionScheduleFormatType": {
            "value": "Weekly"
          },
          "retentionScheduleWeekly": {
            "value": "[reference('DefineWeeklyRetentionSchedule').outputs.retentionScheduleWeekly.value]"
          },
          "retentionTimes": {
            "value": "[createArray('02:30')]"
          }
        }
      }
    },
    {
      "name": "DefineYearlyRetentionDuration",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/retentionDuration.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "count": {
            "value": 68
          },
          "durationType": {
            "value": "Years"
          }
        }
      }
    },
    {
      "name": "DefineYearlySchedulePolicy",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','DefineYearlyRetentionDuration')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/yearlySchedule.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "monthsOfYear": {
            "value": "[createArray('January')]"
          },
          "retentionDuration": {
            "value": "[reference('DefineYearlyRetentionDuration').outputs.retentionDuration.value]"
          },
          "retentionScheduleDaily": {
            "value": {}
          },
          "retentionScheduleFormatType": {
            "value": "Weekly"
          },
          "retentionScheduleWeekly": {
            "value": "[reference('DefineWeeklyRetentionSchedule').outputs.retentionScheduleWeekly.value]"
          },
          "retentionTimes": {
            "value": "[createArray('02:30')]"
          }
        }
      }
    },
    {
      "name": "DefineRetentionPolicy",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','DefineDailySchedulePolicy')]",
        "[concat('Microsoft.Resources/deployments/','DefineWeeklySchedulePolicy')]",
        "[concat('Microsoft.Resources/deployments/','DefineMonthlySchedulePolicy')]",
        "[concat('Microsoft.Resources/deployments/','DefineYearlySchedulePolicy')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/retentionPolicy.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "dailySchedule": {
            "value": "[reference('DefineDailySchedulePolicy').outputs.dailySchedule.value]"
          },
          "monthlySchedule": {
            "value": "[reference('DefineMonthlySchedulePolicy').outputs.monthlySchedule.value]"
          },
          "retentionPolicyType": {
            "value": "LongTermRetentionPolicy"
          },
          "retentionDuration": {
            "value": {}
          },
          "weeklySchedule": {
            "value": "[reference('DefineWeeklySchedulePolicy').outputs.weeklySchedule.value]"
          },
          "yearlySchedule": {
            "value": "[reference('DefineYearlySchedulePolicy').outputs.yearlySchedule.value]"
          }
        }
      }
    },
    {
      "name": "DefineSchedulePolicy",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/schedulePolicy.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "schedulePolicyType": {
            "value": "SimpleSchedulePolicy"
          },
          "scheduleRunDays": {
            "value": []
          },
          "scheduleRunFrequency": {
            "value": "Daily"
          },
          "scheduleRunTimes": {
            "value": "[createArray('02:30')]"
          },
          "scheduleWeeklyFrequency": {
            "value": 0
          }
        }
      }
    },

    {
      "name": "BuildVmProtectionPolicy",
      "type": "Microsoft.Resources/deployments",
      "apiVersion": "2016-09-01",
      "dependsOn": [
        "[concat('Microsoft.Resources/deployments/','BuildRecoveryServicesVault')]",
        "[concat('Microsoft.Resources/deployments/','DefineRetentionPolicy')]",
        "[concat('Microsoft.Resources/deployments/','DefineSchedulePolicy')]"
      ],
      "properties": {
        "mode": "Incremental",
        "templateLink": {
          "uri": "[concat(variables('templateUri'), '/protectionPolicy.json', parameters('SasToken'))]",
          "contentVersion": "2017.09.01.0"
        },
        "parameters": {
          "name": {
            "value": "BackupPolicy"
          },
          "backupManagementType": {
            "value": "AzureIaasVM"
          },
          "retentionPolicy": {
            "value": "[reference('DefineRetentionPolicy').outputs.retentionPolicy.value]"
          },
          "schedulePolicy": {
            "value": "[reference('DefineSchedulePolicy').outputs.schedulePolicy.value]"
          },
          "tags": {
            "value": "[json('{\"TagName\": \"TagValue\"}')]"
          },
          "timeZone": {
            "value": "Eastern Standard Time"
          },
          "recoveryServicesName": {
            "value": "[reference('BuildRecoveryServicesVault').outputs.vaults.value.name]"
          }
        }
      }
    }
  ],
  "outputs": {
    "vault": {
      "type": "object",
      "value": "[reference('BuildRecoveryServicesVault').outputs.vaults.value]"
    },
    "protectionPolicy": {
      "type": "object",
      "value": "[reference('BuildVmProtectionPolicy').outputs.protectionPolicy.value]"
    }
  }
}
```
