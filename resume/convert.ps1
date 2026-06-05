#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Convert a Markdown resume to HTML, DOCX, and PDF using pandoc.
.PARAMETER InputFile
    Path to the input .md file (default: resume.md)
#>

param(
    [string]$InputFile = "resume.md"
)

# Validate input
if (-not (Test-Path $InputFile)) {
    Write-Host "ERROR: File not found: $InputFile" -ForegroundColor Red
    exit 1
}

if ([System.IO.Path]::GetExtension($InputFile) -ne '.md') {
    Write-Host "ERROR: Input must be a .md file, got: $InputFile" -ForegroundColor Red
    exit 1
}

$inputPath  = Resolve-Path $InputFile
$baseName   = [System.IO.Path]::GetFileNameWithoutExtension($inputPath)
$dir        = [System.IO.Path]::GetDirectoryName($inputPath)

$htmlPath   = Join-Path $dir "$baseName.html"
$docxPath   = Join-Path $dir "$baseName.docx"
$pdfPath    = Join-Path $dir "$baseName.pdf"

$generated  = @()

# Document title for HTML <title> / PDF metadata (not rendered as a body heading)
$docTitle   = "Alejandro Echeverría - Résumé"

Write-Host "`nConverting: $inputPath" -ForegroundColor Cyan

# HTML
& pandoc "$inputPath" -o "$htmlPath" --standalone --css resume.css --embed-resources --metadata "pagetitle=$docTitle" 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "  [HTML]  OK -> $htmlPath" -ForegroundColor Green
    $generated += $htmlPath
} else {
    Write-Host "  [HTML]  FAILED" -ForegroundColor Red
}

# DOCX
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
& pandoc "$inputPath" -o "$docxPath" --reference-doc="$scriptDir\resume-template.docx" 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "  [DOCX]  OK -> $docxPath" -ForegroundColor Green
    $generated += $docxPath
} else {
    Write-Host "  [DOCX]  FAILED" -ForegroundColor Red
}

# PDF — wkhtmltopdf with CSS
& pandoc "$inputPath" -o "$pdfPath" --pdf-engine=wkhtmltopdf --css resume.css --metadata "pagetitle=$docTitle" 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "  [PDF]   OK -> $pdfPath" -ForegroundColor Green
    $generated += $pdfPath
} else {
    Write-Host "  [PDF]   FAILED — install wkhtmltopdf: https://wkhtmltopdf.org" -ForegroundColor Red
}

# Summary
Write-Host "`nGenerated $($generated.Count) file(s):" -ForegroundColor Cyan
$generated | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
