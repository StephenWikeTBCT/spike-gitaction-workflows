#!/usr/bin/env pwsh

$build_configuration = "Release"

$versionInfo = ./ci/calculate-buildInfo.ps1 $true version.json
Write-Host "ProductVersion: $($versionInfo.ProductVersion)"
Write-Host "Branch: $($versionInfo.Branch)"
Write-Host "Release product: $($versionInfo.IsReleaseVersion)"
Write-Host "Build Configuration: $build_configuration"

#docker-login
./ci/docker-login.ps1 

#build
./ci/build.ps1  $versionInfo.ProductVersion $versionInfo.Branch $versionInfo.IsReleaseVersion $build_configuration

#unit test
./ci/unit-tests.ps1 $versionInfo.ProductVersion $versionInfo.Branch $versionInfo.IsReleaseVersion $build_configuration

#generate BOM
$versionForBom = $versionInfo.ProductVersion
$branchForBom = $versionInfo.Branch
./ci/generate-bom.ps1 ./src/BCT.NServiceBus.sln "BOM-NServiceBus-$versionForBom-$branchForBom.xml" bom

#publish
# ./ci/publish.ps1 $versionInfo.ProductVersion $versionInfo.Branch $versionInfo.IsReleaseVersion $build_configuration

#deploy
./ci/deploy.ps1 $versionInfo.ProductVersion $versionInfo.Branch $versionInfo.IsReleaseVersion $build_configuration

#interface tests
# ./ci/interface-tests.ps1 $versionInfo.ProductVersion $versionInfo.Branch $versionInfo.IsReleaseVersion $build_configuration

#cleanup
./ci/cleanup.ps1 $versionInfo.ProductVersion $versionInfo.Branch $versionInfo.IsReleaseVersion $build_configuration
