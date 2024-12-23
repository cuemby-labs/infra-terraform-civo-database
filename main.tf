#
# Civo Database resources
#

# Database
data "civo_database_version" "database" {
  filter {
    key    = "engine"
    values = [var.database_engine]
  }
}

data "civo_size" "size" {
  filter {
    key      = "name"
    values   = [var.database_size]
    match_by = "re"
  }
  filter {
    key    = "type"
    values = ["database"]
  }
}

# Newtwork
data "civo_network" "this" {
    label = var.network_label
}

# Firewall
data "civo_firewall" "this" {
    name = var.network_label
}

# To use this data source, make sure you have a database cluster created.
resource "civo_database" "custom_database" {
  name        = var.database_name
  size        = element(data.civo_size.size.sizes, 0).name
  nodes       = 3
  engine      = element(data.civo_database_version.database.versions, 0).engine
  version     = element(data.civo_database_version.database.versions, 0).version
  firewall_id = data.civo_firewall.this.id
  network_id  = data.civo_network.this.id
}

#
# Walrus resources
#

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}
