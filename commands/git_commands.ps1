function RunGitAmend {
	git commit --amend --no-edit
}

function RunGitStatus { 
	git status -s -u $args
}
function RunGitLogWrap([switch]$all) {
  if($all)
  {
    RunGitLog -a $args | less -R -S
  }
  else
  {
    RunGitLog $args
  }
}
function RunGitLog([switch]$all) {
  if($all)
	{
		git --no-pager log --pretty=format:'%C(yellow)%h %C(red)%ad %C(cyan)%x09%an%x09%C(auto)%d %Creset%s' --date=relative --graph --all $args
	}
	else
	{
		git log --pretty=format:'%C(yellow)%h %C(red)%ad %C(cyan)%x09%an%x09%C(auto)%d %Creset%s' --date=relative --graph $args
	}
}
function RunGitLogSimple()
{
    RunGitLog -5 $args
}
function RunGitLogNew()
{
    RunGitLog origin/master.. -- $args
}
function RunGitLogMaster()
{
    RunGitLog master.. -- $args
}
function RunGitDiff() {
    git diff --word-diff=color -w $args;
}
function RunGitDiffWithClear([string]$file)
{
	clear;
	RunGitDiff($file);
}
function RunGitStatusWithClear {
	clear;
	RunGitStatus $args;
}
function RunGitCommit([string]$message) {
    git commit -m $message;
}
function RunGitDeleteUnaddedFiles() {
	git ls-files --others --exclude-standard | rm
}

function SetGitUsernameEmailForAAU {
    git config user.name "Mikkel Sandø Larsen"
    git config user.email "milars11@student.aau.dk"
}

function RunGitMergeTool {
  git mergetool --no-prompt
}

Set-Alias -Name gstat -Value RunGitStatus
Set-Alias -Name gstac -Value RunGitStatusWithClear
Set-Alias -Name giff -Value RunGitDiff
Set-Alias -Name gliff -Value RunGitDiffWithClear
Set-Alias -Name glog -Value RunGitLogWrap
Set-Alias -Name glo -Value RunGitLogSimple
Set-Alias -Name glon -Value RunGitLogNew
Set-Alias -Name glom -Value RunGitLogMaster
Set-Alias -Name gamend -Value RunGitAmend
Set-Alias -Name gic -Value RunGitCommit
Set-Alias -Name gdelnew -Value RunGitDeleteUnaddedFiles
Set-Alias -Name gmt -Value RungitMergeTool

function LoadVisualStudioGitignore {
    $webclient = New-Object System.Net.WebClient
    $webclient.DownloadFile("https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore", "$pwd\.gitignore")
    $webclient.Dispose()
}
function LoadTexGitignore {
    $webclient = New-Object System.Net.WebClient
    $webclient.DownloadFile("https://raw.githubusercontent.com/github/gitignore/master/TeX.gitignore", "$pwd\.gitignore")
    $webclient.Dispose()
}