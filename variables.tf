#
# Database variables
#

variable "database_engine" {
  description = "The database engine to use, such as 'mysql' or 'postgres'."
  type        = string
  default     = "mysql"
  validation {
    condition     = contains(["mysql", "postgres"], var.database_engine)
    error_message = "The database engine must be either 'mysql' or 'postgres'."
  }
}

variable "database_size" {
  description = "The size of the database instance, such as 'g3.k3.small'. It supports regex matching."
  type        = string
  default     = "db.small"
}

variable "network_label" {
  description = "The label of the network to associate with the database instance."
  type        = string
}

variable "network_firewall" {
  description = "The name of the firewall to associate with the database instance."
  type        = string
}

variable "database_name" {
  description = "The name of the database instance to be created."
  type        = string
  default     = "custom_database"
}

#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}
