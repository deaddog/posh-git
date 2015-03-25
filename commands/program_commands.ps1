function OpenExplorer([string]$path)
{
    if($path -eq "")
    {
        explorer.exe .
    }
    else
    {
        explorer.exe $path
    }
}
function StartNotepadPlusPlus([string]$arg1)
{
    Write-Host "Starting " -ForegroundColor "DarkGray" -NoNewline
    Write-Host "Notepad++" -ForegroundColor "Green" -NoNewline

    if($arg1 -eq "")
    {
        Start-Process "C:\Program Files (x86)\Notepad++\notepad++.exe"
    }
    else
    {
        Write-Host ": ""$arg1""" -NoNewline
        Start-Process "C:\Program Files (x86)\Notepad++\notepad++.exe" $arg1
    }
    Write-Host ""
}
function StartSublimeText([string]$arg1)
{
    Write-Host "Starting " -ForegroundColor "DarkGray" -NoNewline
    Write-Host "Sublime Text 3" -ForegroundColor "Magenta" -NoNewline

    if($arg1 -eq "")
    {
        Start-Process "C:\Program Files\Sublime Text 3\sublime_text.exe"
    }
    else
    {
        Write-Host ": ""$arg1""" -NoNewline
        Start-Process "C:\Program Files\Sublime Text 3\sublime_text.exe" $arg1
    }
    Write-Host ""
}
function ClearLatexDirectory()
{
    ls -r | Where {$_ -match "\.(aux|bbl|bak|bit|blg|dvi|lof|log|lot|glo|ilg|ind|out|pre|synctex.gz|tdo|thm|toc)$"} | rm
}

Set-Alias -Name npp -Value StartNotepadPlusPlus
Set-Alias -Name sub -Value StartSublimeText
Set-Alias -Name ocd -Value OpenExplorer
Set-Alias -Name msbuild -Value "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe"