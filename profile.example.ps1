Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module .\posh-git

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-git


# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
    
    Write-Host("`r`n") -nonewline
    Write-VcsStatus

    if(-Not $Global:GitStatus)
    {
        Write-Host($pwd.ProviderPath + "\") -nonewline
        Write-Host("`r`n") -nonewline
    }
    else
    {
        Write-Host(" " + $pwd.ProviderPath + "\") -nonewline -foregroundcolor "yellow"
        Write-Host("`r`n") -nonewline
    }

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

Enable-GitColors

Pop-Location

$thisScript = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ($thisScript + '.\commands\git_commands.ps1')
. ($thisScript + '.\commands\program_commands.ps1')