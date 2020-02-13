#!/usr/bin/env pwsh

Write-Output "Building..."

Get-ChildItem env:

$env:MyTestVariable = "My temporary test variable."


echo "DONE!!!"

echo "Lets try again...."

Get-ChildItem env:

echo "DONE AGAIN!!!"
