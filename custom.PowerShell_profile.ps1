$show_interactive_shell_message_Override = $false

Add-Type -Path "$script:ProfileRoot\PowerShellAudio.cs"

foreach ($script in (Get-Item $script:ProfileRoot\Scripts\*.ps1)) {
  . $script
}

Set-Alias -Name wg -Value winget.exe -Force

function Get-RemovableDrive {
  $listDrives = Get-Volume |
    #Select-Object -Property DriveLetter, DriveType |
    Where-Object {$_.DriveLetter -ne $null -and $_.DriveType -eq 'Removable'}
  Write-Output $listDrives
}

function Eject-RemovableDrive ([String] $driveLetter) {
  $drive = New-Object -ComObject Shell.Application
  $drive.Namespace(17).ParseName($driveLetter).InvokeVerb('Eject')
}

function Make-SymLink ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function Make-HardLink ($target, $link) {
    New-Item -Path $link -ItemType HardLink -Value $target
}

function Make-Junction ($target, $link) {
    New-Item -Path $link -ItemType Junction -Value $target
}

function locip ([String]$addressFamily = 'IPv4') {
  Get-NetIPAddress -AddressFamily $addressFamily | Select-Object 'InterfaceAlias', 'IPAddress'
}

function Set-Brightness ($percent) {
  $cim = Get-CimInstance -Namespace root/wmi -ClassName WmiMonitorBrightnessMethods
  Invoke-CimMethod `
    -InputObject $cim `
    -MethodName WmiSetBrightness `
    -Arguments @{Brightness = $percent; Timeout = 1} | Out-Null
}

function Set-Volume {
  param (
    [Int]$percent = [Audio]::Volume * 100,
    [Switch]$mute
  )
  [Audio]::Volume = [Math]::Clamp($percent, 0, 100) / 100
  [Audio]::Mute = $mute
}
