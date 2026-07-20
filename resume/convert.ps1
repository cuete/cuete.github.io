#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Convert one or more Markdown files (resume and/or cover letter) to a
    template-styled PDF via pandoc + LibreOffice.
.DESCRIPTION
    Cover letters (filename containing "_cover") use cover-template.docx;
    everything else uses resume-template.docx. The intermediate .docx is
    deleted once the PDF is confirmed to exist and be nonzero size - only
    .md and .pdf should remain (see feedback_job_applications memory).
.PARAMETER InputFiles
    Paths to the input .md files (default: resume.md)
#>

param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$InputFiles = @("resume.md")
)

$scriptDir      = Split-Path -Parent $MyInvocation.MyCommand.Path
$resumeTemplate = Join-Path $scriptDir "resume-template.docx"
$coverTemplate  = Join-Path $scriptDir "cover-template.docx"
$luaFilter      = Join-Path $scriptDir "strip-ids.lua"
$soffice        = "C:\Program Files\LibreOffice\program\soffice.exe"

foreach ($InputFile in $InputFiles) {
    if (-not (Test-Path $InputFile)) {
        Write-Host "ERROR: File not found: $InputFile" -ForegroundColor Red
        continue
    }

    if ([System.IO.Path]::GetExtension($InputFile) -ne '.md') {
        Write-Host "ERROR: Input must be a .md file, got: $InputFile" -ForegroundColor Red
        continue
    }

    $inputPath = Resolve-Path $InputFile
    $baseName  = [System.IO.Path]::GetFileNameWithoutExtension($inputPath)
    $dir       = [System.IO.Path]::GetDirectoryName($inputPath)

    $docxPath  = Join-Path $dir "$baseName.docx"
    $pdfPath   = Join-Path $dir "$baseName.pdf"

    $template = if ($baseName -like "*_cover*") { $coverTemplate } else { $resumeTemplate }

    Write-Host "`nConverting: $inputPath" -ForegroundColor Cyan

    & pandoc "$inputPath" -o "$docxPath" --reference-doc="$template" --lua-filter="$luaFilter" 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  [DOCX]  FAILED" -ForegroundColor Red
        continue
    }
    Write-Host "  [DOCX]  OK -> $docxPath" -ForegroundColor Green

    # Calling soffice.exe directly via `&` has been observed to fail
    # silently (exit 1, no output) intermittently - use Start-Process -Wait
    # with redirected stdout/stderr instead, which reliably returns exit 0
    # with a "convert ... -> ...pdf" confirmation line.
    $p = Start-Process -FilePath $soffice `
      -ArgumentList "--headless","--convert-to","pdf","--outdir","`"$dir`"","`"$docxPath`"" `
      -NoNewWindow -PassThru -RedirectStandardOutput "$env:TEMP\so_out.txt" -RedirectStandardError "$env:TEMP\so_err.txt" -Wait

    if ($p.ExitCode -ne 0) {
        Write-Host "  [PDF]   FAILED — is LibreOffice installed?" -ForegroundColor Red
        continue
    }

    if ((Test-Path $pdfPath) -and (Get-Item $pdfPath).Length -gt 0) {
        Write-Host "  [PDF]   OK -> $pdfPath" -ForegroundColor Green
        Remove-Item $docxPath
        Write-Host "  [CLEANUP] removed $docxPath" -ForegroundColor Gray
    } else {
        Write-Host "  [PDF]   FAILED — no/empty output, keeping $docxPath for troubleshooting" -ForegroundColor Red
    }
}
