# Сканирует папку mems/ и обновляет index.json
$dir = Split-Path $MyInvocation.MyCommand.Path
$files = Get-ChildItem $dir -File | Where-Object { $_.Extension -match '\.(png|jpg|jpeg|gif|webp|bmp)$' } | Sort-Object Name
$names = $files.Name | ForEach-Object { '"' + $_ + '"' }
$json = "[" + ($names -join ",") + "]"
Set-Content -Path (Join-Path $dir "index.json") -Value $json -Encoding UTF8
Write-Host "index.json updated with $($files.Count) memes"
