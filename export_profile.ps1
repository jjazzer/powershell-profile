$profileDir = $PROFILE.CurrentUserCurrentHost | Split-Path

Copy-Item -Path $PSScriptRoot\*.ps1 -Destination $profileDir -Force
