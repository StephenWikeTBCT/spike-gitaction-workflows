#!/usr/bin/env pwsh

Write-Output "Building..."

$env:MyLocalVariable = "My temporary test variable."
[System.Environment]::SetEnvironmentVariable('MY_USER_VAR','My User scoped test variable'), [System.EnvironmentVariableTarget]::User)

Get-ChildItem env:

echo "DONE AGAIN!!!"
