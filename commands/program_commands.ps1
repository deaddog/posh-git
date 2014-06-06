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

Set-Alias -Name npp -Value StartNotepadPlusPlus
Set-Alias -Name ex -Value OpenExplorer