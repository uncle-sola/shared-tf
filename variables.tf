variable "project_code" {
  type        = string
  description = "Project Code (e.g. API, WHS)"
  validation {
    condition = contains([
      "API",
      "ALP",
      "WHS"
    ], var.project_code)
    error_message = "project_code should be set to one of 'API', 'ALP', 'WHS'."
  }
}

variable "environment" {
  type        = string
  description = "Environment (e.g. Dev, PreProd, PP or Prod, NonProd)"
  validation {
    # The condition will cater for Pascal and upper case environments in the short-term
    # We will consider if we need to force the case on validation, or update the module to set the correct casing
    # Adding temp conditions to allow LZ redeployments
    condition = contains([
      "dev",
      "Dev",
      "DEV",
      "development",
      "Development",
      "DEVELOPMENT",
      "PP",
      "PreProd",
      "PREPROD",
      "preproduction",
      "PreProduction",
      "PREPRODUCTION",
      "pre",
      "Prod",
      "PROD",
      "production",
      "Production",
      "PRODUCTION",
      "prd",
      "NONPROD",
      "nonprod",
      "NonProd",
      "NonProduction",
      "NONPRODUCTION",
      "nonproduction"
    ], var.environment)
    # Error message will be updated once the LZ stuff has been redeployed etc. this is an interim state
    error_message = "Environment must match one of  'Dev', 'Development', 'PreProd', 'PreProduction', 'pre', 'Prod', 'Production', 'prd', 'NonProd' or 'NonProduction'."
  }
}

variable "region" {
  type        = string
  description = "Target region/location"
  validation {
    condition = contains([
      "northeurope",
      "uksouth",
      "westeurope",
      "global"
    ], lower(replace(var.region, " ", "")))
    error_message = "Currently only a 'Global' and UK South and North and West europe regions are supported by the naming convention, e.g. full name with or without space."
  }
}