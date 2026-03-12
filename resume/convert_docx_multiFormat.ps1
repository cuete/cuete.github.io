#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Convert resume.docx to multiple formats (PDF, HTML, MD, TXT)
.DESCRIPTION
    This script converts resume.docx to PDF, HTML, Markdown, and plain text formats.
    It attempts to use Microsoft Word COM for PDF conversion (Windows only),
    and pandoc for other formats.
.PARAMETER InputFile
    Path to the input DOCX file (default: resume.docx)
#>

param(
    [string]$InputFile = "resume.docx"
)

# Check if input file exists
if (-not (Test-Path $InputFile)) {
    Write-Error "Input file '$InputFile' not found!"
    exit 1
}

$inputPath = Resolve-Path $InputFile
$baseName = [System.IO.Path]::GetFileNameWithoutExtension($inputPath)
$directory = [System.IO.Path]::GetDirectoryName($inputPath)

Write-Host "Converting $InputFile to multiple formats..." -ForegroundColor Cyan

# Function to convert using Microsoft Word COM (Windows only)
function Convert-WithWord {
    param($Source, $Destination, $Format)

    try {
        $word = New-Object -ComObject Word.Application
        $word.Visible = $false
        $doc = $word.Documents.Open($Source)

        # Save as PDF (format 17)
        $doc.SaveAs([ref]$Destination, [ref]$Format)
        $doc.Close()
        $word.Quit()

        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($word) | Out-Null
        Remove-Variable word
        [GC]::Collect()
        [GC]::WaitForPendingFinalizers()

        return $true
    }
    catch {
        Write-Warning "Word COM conversion failed: $_"
        return $false
    }
}

# Convert to PDF
$pdfPath = Join-Path $directory "$baseName.pdf"
Write-Host "Converting to PDF..." -ForegroundColor Yellow

if ($IsWindows -or $PSVersionTable.PSVersion.Major -lt 6) {
    # Try Word COM first on Windows
    $wordSuccess = Convert-WithWord -Source $inputPath -Destination $pdfPath -Format 17

    if (-not $wordSuccess) {
        Write-Host "Trying pandoc for PDF conversion..." -ForegroundColor Yellow
        & pandoc "$inputPath" -o "$pdfPath" 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "PDF created: $pdfPath" -ForegroundColor Green
        } else {
            Write-Warning "PDF conversion failed. Install pandoc or ensure Word is available."
        }
    } else {
        Write-Host "PDF created: $pdfPath" -ForegroundColor Green
    }
} else {
    # Use pandoc on non-Windows platforms
    & pandoc "$inputPath" -o "$pdfPath" 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "PDF created: $pdfPath" -ForegroundColor Green
    } else {
        Write-Warning "PDF conversion failed. Install pandoc."
    }
}

# Convert to HTML
$htmlPath = Join-Path $directory "$baseName.html"
Write-Host "Converting to HTML..." -ForegroundColor Yellow
& pandoc "$inputPath" -o "$htmlPath" --standalone 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "HTML created: $htmlPath" -ForegroundColor Green
} else {
    Write-Warning "HTML conversion failed."
}

# Convert to Markdown
$mdPath = Join-Path $directory "$baseName.md"
Write-Host "Converting to Markdown..." -ForegroundColor Yellow
& pandoc "$inputPath" -o "$mdPath" --wrap=none 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "Markdown created: $mdPath" -ForegroundColor Green
} else {
    Write-Warning "Markdown conversion failed."
}

# Convert to Plain Text
$txtPath = Join-Path $directory "$baseName.txt"
Write-Host "Converting to Plain Text..." -ForegroundColor Yellow
& pandoc "$inputPath" -o "$txtPath" --wrap=none 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "Plain text created: $txtPath" -ForegroundColor Green
} else {
    Write-Warning "Plain text conversion failed."
}

Write-Host "`nConversion complete!" -ForegroundColor Cyan
Write-Host "Output files:" -ForegroundColor Cyan
Get-ChildItem -Path $directory -Filter "$baseName.*" | Where-Object { $_.Extension -in @('.pdf', '.html', '.md', '.txt') } | ForEach-Object {
    Write-Host "  - $($_.FullName)" -ForegroundColor Gray
}
