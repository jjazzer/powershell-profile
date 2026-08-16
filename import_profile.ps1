$profileDir = $PROFILE.CurrentUserCurrentHost | Split-Path
$scriptPaths = @(
	"$profileDir\Microsoft.PowerShell_profile.ps1"
	"$profileDir\custom.PowerShell_profile.ps1"
	Resolve-Path "$profileDir\Scripts\*.ps1"
	Resolve-Path "$profileDir\*.cs"
)

Copy-Item -Path $scriptPaths -Destination $PSScriptRoot -Force -Recurse
