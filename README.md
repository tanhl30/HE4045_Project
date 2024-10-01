## How to do version control on this repo

### Getting started
1. Download Git at https://git-scm.com/downloads
2. Download VScode at https://code.visualstudio.com/download, or you can use your prefered IDE and terminal 
3. For the first time you should clone the existing repository to your local machine

    'git clone https://github.com/tanhl30/HE4045-.git'
4. change directory to the project folder and start working 

    'cd HE4045-'

### Pull, Push & Commit
1. Before starting work or when someone has made changes, sync your local repo with the latest changes from the remote repository:

    'git pull origin master'

2. Save your changes (Ctrl+S) after working on your file and stage all updates for commit:

    'git add . '

3. Commit your changes with a meaningful message explaining what you've done:

    'git commit -m "your commit message"'

4. Push your committed changes to the remote repository:

    'git push origin master'

### Useful command 
1. 'git status' to check the status of the project file, whether saved or unsaved
2. 'git remote' to check the current remote repository
3. Instead of 'master', you could push to different branches such as 'dev' or 'test'
4. 'cd "your directory"' or 'cd ..' to go back to the previous directory
5. 'ls' to list the files in the current directory


    '