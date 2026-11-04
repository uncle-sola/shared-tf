data "azurerm_monitor_diagnostic_categories" "categories" {
  count       = length(var.targets_resource_id)
  resource_id = var.targets_resource_id[count.index]
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  count                          = length(var.targets_resource_id)
  name                           = split("/", var.log_analytics_workspace_id)[length(split("/", var.log_analytics_workspace_id)) - 1]
  target_resource_id             = data.azurerm_monitor_diagnostic_categories.categories[count.index].id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type

  dynamic "enabled_metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.categories[count.index].metrics
    content {
      category = enabled_metric.value
    }
  }

  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.categories[count.index].log_category_types
    content {
      category = enabled_log.value
    }
  }
}
