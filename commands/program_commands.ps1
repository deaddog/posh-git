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
    ls -r | Where {$_ -match "\.(aux|bbl|bak|bit|blg|dvi|lof|log|lot|glo|ilg|ind|out|pre|synctex.gz|tdo|thm|toc|run.xml|)$"} | rm
}
function OpenVisualStudioSolution() {
  $path = (Get-Item .).fullname

  while ($true) {
    $a = ls $path | Where { $_ -match "\.sln$" } | Select-Object -first 1

    if (!($a -eq $null))
    {
      Write-Host "Opening """ -ForegroundColor "DarkGray" -NoNewline
      Write-Host $a -ForegroundColor "Green" -NoNewline
      Write-Host """ in Visual Studio" -ForegroundColor "DarkGray"

      #Invoke-Item $a.fullname
      Start-Process "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe" $a.fullname
      return;
    }
    else
    {
      $path = (get-item $path).parent
      if ($path -eq $null) {
        Write-Host "No solution file found." -ForegroundColor "Red"
        return;
      }
      else {
        $path = $path.fullname
      }
    }
  }
}

function BuildRelease()
{
    C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe /p:Configuration=Release
}

Set-Alias -Name npp -Value StartNotepadPlusPlus
Set-Alias -Name sub -Value StartSublimeText
Set-Alias -Name ocd -Value OpenExplorer
Set-Alias -Name vs -Value OpenVisualStudioSolution
Set-Alias -Name msbuild -Value "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe"
Set-Alias -Name msbuildr -Value BuildRelease