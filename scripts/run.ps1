#!/usr/bin/env pwsh
# Roda o app. Por padrao aponta para o backend REMOTO (publicado).
#
#   scripts/run.ps1                 -> remoto (Vercel) — nao precisa de backend local
#   scripts/run.ps1 emulator       -> http://10.0.2.2:3000 (backend local visto pelo emulador)
#   scripts/run.ps1 device         -> http://<IP-da-maquina>:3000 (celular fisico na mesma rede)
#   scripts/run.ps1 remote         -> igual ao padrao (explicito)
#
# Qualquer outro argumento passa direto pro `flutter run`:
#   scripts/run.ps1 -d chrome
#   scripts/run.ps1 emulator -d chrome

[CmdletBinding()]
param(
    [string]$Target = '',
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$FlutterArgs
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

$known = @('remote', 'emulator', 'device')
if ($Target -and $Target -notin $known) {
    # 1o argumento nao e um alvo -> repassa pro flutter
    $FlutterArgs = @($Target) + $FlutterArgs
    $Target = ''
}
if (-not $Target) { $Target = 'remote' }

$defines = switch ($Target) {
    'remote'   { @("--dart-define-from-file=$root/config/prod.json") }
    'emulator' { @("--dart-define-from-file=$root/config/dev.json") }
    'device'   {
        $ip = Get-NetIPAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue |
            Where-Object {
                $_.IPAddress -notmatch '^(127\.|169\.254\.)' -and
                $_.PrefixOrigin -in 'Dhcp', 'Manual' -and
                $_.InterfaceAlias -notmatch 'vEthernet|WSL|Docker|VirtualBox|Loopback|Hyper-V'
            } |
            Sort-Object @{ Expression = { $_.IPAddress -like '192.168.*' -or $_.IPAddress -like '10.*' }; Descending = $true } |
            Select-Object -ExpandProperty IPAddress -First 1
        if ($ip) {
            $answer = Read-Host "IP detectado: $ip - Enter para usar, ou digite outro"
            if ($answer) { $ip = $answer }
        }
        else {
            $ip = Read-Host 'Nao detectei o IP. Digite o IP desta maquina (ex: 192.168.0.10)'
        }
        Write-Host "Apontando para http://${ip}:3000 (backend deve estar rodando e acessivel na rede)" -ForegroundColor Green
        @("--dart-define=API_BASE_URL=http://${ip}:3000", '--dart-define=APP_ENV=dev')
    }
}

if ($Target -eq 'remote') {
    Write-Host 'Backend: remoto (Vercel). Use "emulator" ou "device" para backend local.' -ForegroundColor DarkGray
}

$flutter = 'flutter'
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    if ($env:FLUTTER_ROOT -and (Test-Path "$env:FLUTTER_ROOT/bin/flutter.bat")) {
        $flutter = "$env:FLUTTER_ROOT/bin/flutter.bat"
    }
    else {
        throw 'flutter nao esta no PATH. Adicione o SDK ao PATH ou defina FLUTTER_ROOT.'
    }
}

Write-Host "> $flutter run $($defines -join ' ') $($FlutterArgs -join ' ')" -ForegroundColor DarkGray
& $flutter run @defines @FlutterArgs
