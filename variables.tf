variable "name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the workspace."
  type        = string
}

variable "location" {
  description = "Azure region in which to create the workspace."
  type        = string
}

variable "sku" {
  description = "SKU of the workspace. Typically PerGB2018 or CapacityReservation."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Number of days ingested data is retained, between 30 and 730."
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  description = "Daily ingestion cap in GB. -1 means unlimited."
  type        = number
  default     = -1
}

variable "internet_ingestion_enabled" {
  description = "Whether log ingestion over the public internet is permitted."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Whether querying the workspace over the public internet is permitted."
  type        = bool
  default     = true
}

variable "reservation_capacity_in_gb_per_day" {
  description = "Reserved daily capacity in GB, only used when sku is CapacityReservation."
  type        = number
  default     = 100
}

variable "tags" {
  description = "Map of tags applied to the workspace."
  type        = map(string)
  default     = {}
}
