#!/usr/bin/env pwsh

Write-Output "Building..."

$env:MyLocalVariable = "My temporary test variable."

[System.Environment]::SetEnvironmentVariable('MY_USER_VAR','My User scoped test variable',[System.EnvironmentVariableTarget]::User)

[System.Environment]::SetEnvironmentVariable('MY_MACHINE_VAR','My Machine scoped test variable',[System.EnvironmentVariableTarget]::Machine)

$MY_EXPLICIT_VAR = 'My Explicit test variable'

[environment]::GetEnvironmentVariable("myY", "User")

[Environment]::SetEnvironmentVariable("myY", "la la", "User")

[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Program Files (x86)\PHP", "Machine")


Get-ChildItem env:

echo "DONE AGAIN!!!"
