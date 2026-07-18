# terraform-azurerm-log-analytics

Terraform module that manages an [Azure](https://azure.microsoft.com/) Log
Analytics workspace, the collection and query surface behind Azure Monitor.
It exposes retention, ingestion caps and network access controls, and surfaces
the workspace ID and shared key for wiring up diagnostic settings and agents.

## Usage

```hcl
module "log_analytics" {
  source = "github.com/cybercapybara/terraform-azurerm-log-analytics"

  name                = "prod-law"
  resource_group_name = "prod-rg"
  location            = "eastus"
  retention_in_days   = 90

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| azurerm   | >= 3.0   |

## Inputs

| Name                                 | Description                                                          | Type          | Default        | Required |
|--------------------------------------|----------------------------------------------------------------------|---------------|----------------|:--------:|
| `name`                               | Name of the Log Analytics workspace.                                 | `string`      | n/a            |   yes    |
| `resource_group_name`                | Name of the resource group in which to create the workspace.         | `string`      | n/a            |   yes    |
| `location`                           | Azure region in which to create the workspace.                       | `string`      | n/a            |   yes    |
| `sku`                                | SKU of the workspace.                                                | `string`      | `"PerGB2018"`  |    no    |
| `retention_in_days`                  | Days ingested data is retained, between 30 and 730.                 | `number`      | `30`           |    no    |
| `daily_quota_gb`                     | Daily ingestion cap in GB. -1 means unlimited.                      | `number`      | `-1`           |    no    |
| `internet_ingestion_enabled`         | Whether ingestion over the public internet is permitted.             | `bool`        | `true`         |    no    |
| `internet_query_enabled`             | Whether querying over the public internet is permitted.              | `bool`        | `true`         |    no    |
| `reservation_capacity_in_gb_per_day` | Reserved daily capacity in GB (CapacityReservation SKU only).        | `number`      | `100`          |    no    |
| `tags`                               | Map of tags applied to the workspace.                                | `map(string)` | `{}`           |    no    |

## Outputs

| Name                 | Description                                            |
|----------------------|--------------------------------------------------------|
| `id`                 | ID of the Log Analytics workspace.                     |
| `name`               | Name of the Log Analytics workspace.                   |
| `workspace_id`       | Customer ID (workspace ID) of the workspace.           |
| `primary_shared_key` | Primary shared key used by agents (sensitive).         |

## License

[MIT](LICENSE)
