$TrafficManagerEndpoint = Get-AzTrafficManagerEndpoint -Name "prod" -Type AzureEndpoints -ProfileName "sqlapp" -ResourceGroupName "test-grp"
$TrafficManagerEndpoint.Weight = 1
Set-AzTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint


$TrafficManagerEndpoint = Get-AzTrafficManagerEndpoint -Name "staging" -Type AzureEndpoints -ProfileName "sqlapp" -ResourceGroupName "test-grp"
$TrafficManagerEndpoint.Weight = 1000
Set-AzTrafficManagerEndpoint -TrafficManagerEndpoint $TrafficManagerEndpoint

