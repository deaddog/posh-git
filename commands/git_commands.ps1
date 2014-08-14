function RunGitAmend {
	git commit --amend --no-edit
}

function RunGitStatus { 
	git status -s
}
function RunGitLog([switch]$all, [int]$c) {
    if($c -le 0) { $c = 0 }
    if($c -eq 0) { $append = "" } else { $append = -$c }
    
	if($all)
	{
		git log --pretty=format:'%C(yellow)%h %C(red)%ad %C(cyan)%x09%an%x09%C(auto)%d %Creset%s' --date=relative --graph --all $append
	}
	else
	{
		git log --pretty=format:'%C(yellow)%h %C(red)%ad %C(cyan)%x09%an%x09%C(auto)%d %Creset%s' --date=relative --graph $append
	}
}
function RunGitLogSimple()
{
    RunGitLog -c 5
}
function RunGitDiff([string]$file) {
    git diff --word-diff=color -w $file
}
function RunGitPush { 
	git push origin master
}
function RunGitPull { 
	git pull origin master
}
function RunGitSync { 
	git pull origin master
    git push origin master
}
function RunGitStatusWithClear {
	clear;
	RunGitStatus;
}
function RunGitCommit([string]$message) {
    git commit -m $message;
}
function RunGitDeleteUnaddedFiles() {
	git ls-files --others --exclude-standard | grep . | rm
}

function SetGitUsernameEmailForAAU {
    git config user.name "Mikkel Sandø Larsen"
    git config user.email "milars11@student.aau.dk"
}

Set-Alias -Name gstat -Value RunGitStatus
Set-Alias -Name gstac -Value RunGitStatusWithClear
Set-Alias -Name giff -Value RunGitDiff
Set-Alias -Name glog -Value RunGitLog
Set-Alias -Name glo -Value RunGitLogSimple
Set-Alias -Name gpush -Value RunGitPush
Set-Alias -Name gpull -Value RunGitPull
Set-Alias -Name gsync -Value RunGitSync
Set-Alias -Name gamend -Value RunGitAmend
Set-Alias -Name gic -Value RunGitCommit
Set-Alias -Name gdelnew -Value RunGitDeleteUnaddedFiles

function LoadVisualStudioGitignore {
    $webclient = New-Object System.Net.WebClient
    $webclient.DownloadFile("https://rawgit.com/github/gitignore/master/VisualStudio.gitignore", "$pwd\.gitignore")
    $webclient.Dispose()
}