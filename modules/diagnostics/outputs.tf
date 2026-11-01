output "diagnostic_setting_id" {
  description = "The resource ID of the diagnostic setting"
  value       = azurerm_monitor_diagnostic_setting.diagnostic_setting[0].id
}

