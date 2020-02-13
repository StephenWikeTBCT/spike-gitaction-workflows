#!/usr/bin/env pwsh

Write-Output "Building..."

Get-ChildItem env:

$env:MyTestVariable = "My temporary test variable."

echo "DONE!!!"
