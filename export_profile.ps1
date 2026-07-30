$profileDir = $PROFILE.CurrentUserCurrentHost | Split-Path
$scriptPaths = @(
	"$PSScriptRoot\Microsoft.PowerShell_profile.ps1"
	"$PSScriptRoot\custom.PowerShell_profile.ps1"
	"$PSScriptRoot\Scripts\"
)

Copy-Item -Path $scriptPaths -Destination $profileDir -Force -Recurse
