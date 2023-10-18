
# Files
### .bash_history
-------------------------------------------------------------
-------------------------------------------------------------
### .bash_profile
alias npp='notepad++.exe -multiInst -nosession'
-------------------------------------------------------------
-------------------------------------------------------------
### .bashrc
export PATH="$PATH:/c/Program Files/Notepad++"
alias npp='"/c/Program Files/Notepad++/notepad++.exe"'
------------------------------------------------------------
-------------------------------------------------------------
### .gitconfig
[user]
	name = Scott Peters
	email = scott.peters@kestrafinancial.com
[gui]
	recentrepo = C:/Users/scott.peters/Documents/git/sqlpuzzles
[core]
	editor = notepad++.exe -multiInst -nosession
------------------------------------------------------------
-------------------------------------------------------------

source ~/.bash_profile
cat ~/.bash_profile


cd "c:\users\scott.peters"
cat ~/.gitconfig
git config --global core.editor "notepad++.exe -multiInst -nosession"
git config --global --list
git commit -am "this adds the files and commits"


ls
ls -al 
git status
npp myexamplefile.txt
rm -rf .git

https://github.com/smpetersgithub/github-demo.git

git pull origin master
git ls-files
