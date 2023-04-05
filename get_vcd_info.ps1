param(
    [Parameter(Mandatory = $true, HelpMessage="Cloud Director address:")]
    [string] $vcdaddr,
    [Parameter(Mandatory = $true, HelpMessage="Cloud Director organization:")]
    [string] $org,
    [Parameter(Mandatory = $true, HelpMessage="Cloud Director catalog-owner organization:")]
    [string] $catalogorg,
    [Parameter(Mandatory = $true, HelpMessage="Cloud Director catalog name:")]
    [string] $catalogname
    )

#Write-Host $vcdaddr $user
Connect-CiServer -Server $vcdaddr -Org system -User $user -Password $password
$vdcs = Get-Org $org | Get-OrgVdc
$nets = $vdcs | Get-OrgVdcNetwork
$catalogs = Get-Org $catalogorg | Get-Catalog -Name $catalogname

Write-Host "Available VDCs:"
$vdcs | select Name, Description, CpuUsedGhz, CpuAllocationGhz, MemoryUsedGB, MemoryAllocationGB, StorageUsedGB, StorageLimitGB | ft -AutoSize

Write-Host "`n`nAvailable Networks:"
$nets | select Name, OrgVdc, DefaultGateway, Netmask, DnsSuffix, PrimaryDns, SecondaryDns | ft -AutoSize

Write-Host "`n`nAvailable StorageProfiles:"
foreach ($vdc in $vdcs){
    Write-Host "`n==================="
    Write-Host "VDC:" $vdc.Name
    Write-Host "-------------------"
    Write-Host "StorageProfiles:"
    $vdc.ExtensionData.VdcStorageProfiles.VdcStorageProfile.Name   
}

Write-Host "`n`nAvailable catalog items:"
foreach ($catalog in $catalogs){
    Write-Host "`n==================="
    Write-Host "Catalog:" $catalog.Name
    Write-Host "-------------------"
    Write-Host "Catalog items:"
    $catalog.ExtensionData.CatalogItems.CatalogItem.name | ?{$_ -notlike "*iso"}
}

Disconnect-CIServer -Server $vcdaddr -Confirm:$false