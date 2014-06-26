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
    Write-Host "Starting Notepad++: ""$arg1"""
	Start-Process "C:\Program Files (x86)\Notepad++\notepad++.exe" $arg1
}
function StartSublimeText([string]$arg1)
{
    Write-Host "Sublime Text 2: ""$arg1"""
	Start-Process "C:\Program Files\Sublime Text 2\sublime_text.exe" $arg1
}

Set-Alias -Name npp -Value StartNotepadPlusPlus
Set-Alias -Name sub -Value StartSublimeText
Set-Alias -Name ex -Value OpenExplorer