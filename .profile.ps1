#Author: psammut

# Set code page to Unicode UTF-8
chcp 65001 > $null

#Force coloring of git and npm commands
# $env:TERM = 'cygwin'
# $env:TERM = 'FRSX'

# Change color of command line parameters
Set-PSReadLineOption -Colors @{Parameter = "Magenta"; Operator = "Magenta"; Type = "Magenta"}

# Color directory listings
# You must install the PSColor module (https://github.com/Davlind/PSColor) first:
# Install-Module PSColor
Import-Module PSColor

# folder in which shell was started
function ~~ {Set-Location $START}
function ~ {Set-Location ~}

function Set-StartDirectory {
    $global:START = Get-Location
    Write-Host
    Write-Host "Start folder set to $START"
    Write-Host
}
Set-Alias set~~ Set-StartDirectory

set~~

function Get-StartDirectory {
    Write-Host
    Write-Host $START
}
Set-Alias get~~ Get-StartDirectory

function gitStatus { git status $args}
Set-Alias gs gitStatus

$DATA = "D:\"
$DOCS = "$DATA\Documents"
$DEV = "X:\"
$SCRIPTS = "$DEV\powershell"
$env:path += ";$SCRIPTS"

function modules {Set-Location $DOCS\PowerShell\Modules}
function docs {Set-Location $DOCS}
function dev {Set-Location $DEV}
function rel {Set-Location $DEV\releases}
function ph {Set-Location $DEV\powershell}
function scripts {Set-Location $SCRIPTS}
function react {Set-Location $DEV\react}
function sysinfo {Clear-Host; screenfetch}

Import-Module PowerPrompt
function Prompt() {
    PowerPrompt
}

function pp { PowerPrompt -show }
function ton { PowerPromptTimer -on }
function toff { PowerPromptTimer -off }
