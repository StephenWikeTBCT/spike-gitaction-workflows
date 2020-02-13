#!/usr/bin/env pwsh

Write-Output "Building..."

Get-ChildItem env:

[Environment]::SetEnvironmentVariable("TestVariableName", "My Test Value")
