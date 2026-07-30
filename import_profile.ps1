$profileDir = $PROFILE.CurrentUserCurrentHost | Split-Path

Copy-Item -Path $profileDir\*.ps1 -Destination $PSScriptRoot -Force
