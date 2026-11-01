# Azure Naming Module

This module allows the Azure naming convention to be simplified by
using module calls to generate the required names.

## Overview

The module requires three arguments  which it uses to calculate names in an output variable.

- Project Code
- Environment
- Region

The Project Code and Environment are case sensitive, please refer to the module code for the supported values.

## Calling the module

The module should be added to a root deployment only. Child modules should not call the module but include a
variable to receive the naming convention. Calling the naming module directly in a child module will download
the module multiple times. Tags should be used when calling the module to ensure no unexpected/breaking changes
are applied.

### Root module

```hcl
module "naming" {
    source          = "git::https://dev.azure.com/prg-cloud/Terraform/_git/Beta.Framework.NamingConvention?ref=vX.X.X"
    department_code = "INF"
    environment     = var.environment
    region          = var.region
}
```

The results names can be referred to by referring to an entry in the `convention` output variable map

```hcl
locals {
    name1 = "MyNsg-${module.naming.convention["network_security_group"]}"
    name2 = "MyVnet-${module.naming.convention["virtual_network"]}"
}
```

### Child module

Referencing the naming convention in the child module

```hcl
variable "naming" {}

locals {
    name1 = "MyNsg-${var.naming.convention["network_security_group"]}"
    name2 = "MyVnet-${var.naming.convention["virtual_network"]}"
}
```

Parent call to child module

```hcl
module "x" {
    source = "xxx"
    naming = module.naming
}
```



## Landing Zone output

To support easier integration for deployments targeting a Landing Zone, additional outputs have been created which define the target Virtual Network and Resource
Group. These can be referred to as per the below example.

```hcl
data "azurerm_virtual_network" {
    name                = module.naming.landing_zone["virtual_network"]
    resource_group_name = module.naming.landing_zone["resource_group"]
}

data "azurerm_subnet" {
    name                 = "MySubnet-${module.naming.convention["subnet"]}"
    virtual_network_name = module.naming.landing_zone["virtual_network"]
    resource_group_name  = module.naming.landing_zone["resource_group"]
}
```

## Examples

Further examples are available in the ./examples folder
