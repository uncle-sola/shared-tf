locals {
  environment_mapping = {
    dev           = "dev"
    Dev           = "dev"
    DEV           = "dev"
    development   = "dev"
    Development   = "dev"
    DEVELOPMENT   = "dev"
    PP            = "pre"
    PreProd       = "pre"
    PREPROD       = "pre"
    preproduction = "pre"
    PreProduction = "pre"
    PREPRODUCTION = "pre"
    Prod          = "prd"
    PROD          = "prd"
    production    = "prd"
    Production    = "prd"
    PRODUCTION    = "prd"
    NONPROD       = "nonprod"
    NONPRODUCTION = "nonprod"
    nonprod       = "nonprod"
    nonproduction = "nonprod"
    NonProd       = "nonprod"
    NonProduction = "nonprod"
    pre           = "pre"
    prd           = "prd"
  }
  environment_short = {
    dev           = "dev"
    pre           = "pre"
    prd           = "prd"
    nonprod       = "nonprod"
    Dev           = "dev"
    DEV           = "dev"
    development   = "dev"
    Development   = "dev"
    DEVELOPMENT   = "dev"
    PP            = "pre"
    PreProd       = "pre"
    PREPROD       = "pre"
    preproduction = "pre"
    PreProduction = "pre"
    PREPRODUCTION = "pre"
    Prod          = "prd"
    PROD          = "prd"
    production    = "prd"
    Production    = "prd"
    PRODUCTION    = "prd"
    NonProd       = "nonprod"
    NONPROD       = "nonprod"
  }
  environment = local.environment_mapping[var.environment]
  # Test environments share the vnet in the "Test" LandingZone environment, therefore we need to transform the environment on demand
  landing_zone_environment = contains(["Test1", "Test2", "Test3", "Test4", "Test5"], var.environment) == true ? "Test" : (
    var.environment == "TEST1" ? "TEST" : var.environment
  )
  landing_zone_suffix = "${var.project_code}-${local.environment_mapping[local.landing_zone_environment]}-${local.region}"
  processed_region    = lower(replace(var.region, " ", ""))
  region_map = {
    northeurope = "eun"
    westeurope  = "euw"
    uksouth     = "uks"
    global      = "glo"
  }
  region          = local.region_map[local.processed_region]
  standard_suffix = "${local.environment}-${var.project_code}-${local.region}"
}