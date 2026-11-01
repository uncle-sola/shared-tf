
output "convention" {
  description = "Map containing predefined naming conventions for subset of Azure resource types"
  value = {
    action_group                      = lower("${local.standard_suffix}-ag")
    activity_log_alert                = lower("${local.standard_suffix}-ala")
    api_management                    = lower("${local.standard_suffix}-apm")
    application_gateway               = lower("${local.standard_suffix}-agw")
    application_insights              = lower("${local.standard_suffix}-ain")
    application_security_group        = lower("${local.standard_suffix}-asg")
    app_configuration                 = lower("${local.standard_suffix}-cfg")
    app_service_plan                  = lower("${local.standard_suffix}-asp")
    automation_account                = lower("${local.standard_suffix}-aa")
    availability_set                  = lower("${local.standard_suffix}-avs")
    az_firewall                       = lower("${local.standard_suffix}-afw")
    az_firewall_policy                = lower("${local.standard_suffix}-afp")
    backup_vault                      = lower("${local.standard_suffix}-bv")
    backup_policy                     = lower("${local.standard_suffix}-bpl")
    bastion_host                      = lower("${local.standard_suffix}-bas")
    batch_account                     = lower("${local.environment_short[local.environment]}${var.project_code}${local.region}ba")
    cognitive_search                  = lower("${local.standard_suffix}-csh")
    cognitive_service                 = lower("${local.standard_suffix}-csv")
    compute_gallery                   = lower("${local.environment_short[local.environment]}_${var.project_code}_${local.region}_gal")
    container_registry                = lower("${local.environment_short[local.environment]}${var.project_code}${local.region}cr")
    cosmos_db_account                 = lower("${local.standard_suffix}-cosmos")
    databricks                        = lower("${local.standard_suffix}-dbk")
    data_collection_endpoint          = lower("${local.standard_suffix}-dce")
    data_collection_rule              = lower("${local.standard_suffix}-dcr")
    data_collection_rule_association  = lower("${local.standard_suffix}-dcra")
    data_factory                      = lower("${local.standard_suffix}-adf")
    data_lake_store                   = lower("${local.environment_short[local.environment]}${var.project_code}${local.region}dls")
    diagnostics                       = lower("${local.standard_suffix}-diag")
    eventgrid_domain                  = lower("${local.standard_suffix}-egd")
    eventgrid_topic                   = lower("${local.standard_suffix}-egt")
    eventgrid_system_topic            = lower("${local.standard_suffix}-egs")
    eventhub                          = lower("${local.standard_suffix}-evh")
    eventhub_namespace                = lower("${local.standard_suffix}-evn")
    front_door                        = lower("${local.environment}-${var.project_code}-glo-fd")
    front_door_waf_policy             = lower("${local.environment}${var.project_code}glofdwaf")
    function_app                      = lower("${local.standard_suffix}-fa")
    key_vault                         = lower("${local.environment_short[local.environment]}-${var.project_code}-${local.region}-kv")
    kubernetes                        = lower("${local.standard_suffix}-aks")
    load_balancer_external            = lower("${local.standard_suffix}-lbe")
    load_balancer_internal            = lower("${local.standard_suffix}-lbi")
    logic_app                         = lower("${local.standard_suffix}-log")
    log_analytics                     = lower("${local.standard_suffix}-law")
    managed_disk                      = lower("${local.standard_suffix}-dsk")
    managed_identity                  = lower("${local.standard_suffix}-mid")
    managed_image                     = lower("${local.standard_suffix}-img")
    network_security_group            = lower("${local.standard_suffix}-nsg")
    private_endpoint                  = lower("${local.standard_suffix}-pep")
    private_link_service              = lower("${local.standard_suffix}-pls")
    proximity_placement_group         = lower("${local.standard_suffix}-ppg")
    public_dns_zone_suffix            = lower("${local.standard_suffix}")
    public_ip                         = lower("${local.standard_suffix}-pip")
    public_ip_prefix                  = lower("${local.standard_suffix}-ipp")
    recovery_services_vault           = lower("${local.standard_suffix}-rsv")
    resource_group                    = lower("${local.standard_suffix}-rg")
    route_table                       = lower("${local.standard_suffix}-rtb")
    servicebus_namespace              = lower("${local.standard_suffix}-sb")
    service_principal                 = lower("${local.environment}-${var.project_code}-spn")
    signalr                           = lower("${local.standard_suffix}-sig")
    sql_managed_instance              = lower("az-sqlmi-${local.standard_suffix}")
    sql_server                        = lower("${local.standard_suffix}-sql")
    sql_database                      = lower("${local.standard_suffix}-sql-db")
    static_web_app                    = lower("stapp-${local.environment}-${var.project_code}-glo")
    storage_account                   = lower("${local.environment_short[local.environment]}${var.project_code}${local.region}st")
    subnet                            = lower("${local.standard_suffix}-snet")
    traffic_manager_profile           = lower("${local.standard_suffix}-trm")
    virtual_desktop_application_group = lower("${local.standard_suffix}-vdag")
    virtual_desktop_pool              = lower("${local.standard_suffix}-vdp")
    virtual_desktop_scaling_plan      = lower("${local.standard_suffix}-vdsp")
    virtual_desktop_workspace         = lower("${local.standard_suffix}-vdws")
    virtual_machine                   = lower("${local.environment_short[local.environment]}${var.project_code}${local.region}vm")
    virtual_network                   = lower("${local.standard_suffix}-vnet")
    virtual_network_gateway           = lower("${local.standard_suffix}-vgw")
    vm_scale_set                      = lower("${local.standard_suffix}-vmss")
    waf_policy                        = lower("${local.standard_suffix}-waf")
    web_app                           = lower("${local.standard_suffix}-web")
  }
}

output "environment_name" {
  description = "The environment name if required outside the naming convention for any reason"
  value       = local.environment
}

output "environment_short_code" {
  description = "The environment short code if required outside the naming convention for any reason"
  value       = local.environment_short[local.environment]
}

output "region_short_code" {
  description = "The region short code if required outside the naming convention for any reason"
  value       = local.region
}

output "landing_zone" {
  description = "Map containing values for core Landing Zone network resources"
  value = {
    resource_group  = lower("landingzonenet-rg-${local.landing_zone_suffix}")
    virtual_network = lower("landingzone-vnet-${local.landing_zone_suffix}")
  }
}

output "project_code" {
  description = "The project code if required outside the naming convention for any reason"
  value       = var.project_code
}