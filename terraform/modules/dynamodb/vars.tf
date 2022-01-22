variable "table_name" {
  type        = string
  description = "The name given to the DynamoDB table"
}

variable "billing_mode" {
  type        = string
  description = "Controls how you are charged for read and write throughput and how you manage capacity"
  default     = "PROVISIONED"
}

variable "read_capacity" {
  type        = number
  description = "The number of read units for the table"
  default     = "10"
}

variable "write_capacity" {
  type        = number
  description = "The number of write units for the table"
  default     = "10"
}

variable "hash_key" {
  type        = string
  description = "The attribute to use as the hash (partition) key"
}

variable "range_key" {
  type        = string
  description = "The attribute to use as the range (sort) key"
}

variable "additional_table_tags" {
  type        = map(string)
  description = "Additional tags associated with the table"
  default     = {}
}
