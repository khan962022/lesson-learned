resource "azurerm_service_plan" "plan889263" {
  name                = "plan889263"
  resource_group_name = "test-grp"
  location            = "northeurope"
  os_type             = "Windows"
  sku_name            = "F1"
}


# Create the web app, pass in the App Service Plan ID
resource "azurerm_windows_web_app" "webapp889263" {
  name                  = "webapp889263"
  location              = "northeurope"
  resource_group_name   = "test-grp"
  service_plan_id       = azurerm_service_plan.plan889263.id
  site_config { 
    always_on = false
    application_stack{
      current_stack  = "dotnet"
      dotnet_version  = "v6.0"
    }
    minimum_tls_version = "1.2"
  }
  depends_on = [
   azurerm_service_plan.plan889263
  ]
}

resource "azurerm_mssql_server" "sqlsrv889263" {
  name                         = "sqlsrv889263"
  resource_group_name          = "test-grp"
  location                     = "northeurope"
  version                      = "12.0"
  administrator_login          = "khan"
  administrator_login_password = "Ishraq@889263"
}

resource "azurerm_mssql_database" "sqldb889263" {
  name           = "sqldb889263"
  server_id      = azurerm_mssql_server.sqlsrv889263.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = false
  depends_on = [
      azurerm_mssql_server.sqlsrv889263
  ]
  storage_account_type                = "Local"
}
