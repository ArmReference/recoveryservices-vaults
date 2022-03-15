# Resource Notes

## Microsoft.RecoveryServices/vaults

## APIVersion 2021-08-01

This template defines the properties required to deploy a Recovery Services Vault in Azure.

## Encryption

Currently (2021-03-15) Enabling encryption at deployment time is in [public preview](https://docs.microsoft.com/en-us/azure/backup/encryption-at-rest-with-cmk?tabs=portal#enable-encryption-using-customer-managed-keys-at-vault-creation-in-preview).

## Common Complaints

I will continue to harp on documentation and the lack thereof. We are missing defaults all over the place and often simple descriptions both of which would go a long way towards making this documentation much more useful and functional.

## Vaults

### SKU

The SKU object is defined in the schema as a full object:

```json
"sku": {
 "capacity": "",
 "family": "",
 "name": "",
 "size": "",
 "tier": ""
}
```

The only property required is "name" and it is an enum of strings:

```json
"enum": [
 "Standard",
 "RS0
]
```

I think any other key/value pairs passed in will be ignored but I've not tested that. It's worth noting that you can pass in Name as RSO and Tier as Standard and ARM will accept that, so I'm unclear what the difference is. Some additional notes around SKU while testing deployment.

The full object with only the required parameter fails.

```json
"sku": {
 "capacity": "",
 "family": "",
 "name": "RS0",
 "size": "",
 "tier": ""
}
```

The full object with name and tier set to older values (theoretically) passes validation.

```json
"sku": {
 "capacity": "",
 "family": "",
 "name": "RS0",
 "size": "",
 "tier": "Standard"
}
```

Passing an object with name only fails on RS0

```json
"sku": {
 "name": "RS0",
}
```

Passing an object with name set to Standard passes validation

```json
"sku": {
 "name": "Standard",
}
```

Additional research is required here.

### SchedulePolicy

It feels as though LongtermSchedulePolicy is missing all the things, for example the Log policy has two items, the type and frequency. The Simple schedule has the type, days it runs, times it runs and a frequency. Looking at Longterm it just has a string type, 'LongTermSchedulePolicy'.

## eTag

I believe that this property is not set at deployment time, yet it's listed in the arm template reference as well as the API and schema.
