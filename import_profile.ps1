$profileDir = $PROFILE.CurrentUserCurrentHost | Split-Path
$scriptPaths = @(
	"$profileDir\Microsoft.PowerShell_profile.ps1"
	"$profileDir\custom.PowerShell_profile.ps1"
	"$profileDir\Scripts\"
)

Copy-Item -Path $scriptPaths -Destination $PSScriptRoot -Force -Recurse
