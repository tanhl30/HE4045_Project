## How to do version control on this repo

### What is in this repo?
- `loan.csv` is our source data file. Github can only stored file less than 100MB so we have to use git-lfs to store the file. It will store the file elsewhere and put a pointer in our repo. 
- `.gitattreibutes` is the file that tells git to use git-lfs to store the file.
- `main.py` will be our main file for now 

### Getting started
1. Download Git at https://git-scm.com/downloads
2. Download VScode at https://code.visualstudio.com/download, or you can use your preferred IDE and terminal.
3. Because our source data file is too big, we need to install https://git-lfs.com/. Once it is installed, initialize it at your vscode terminal `git lfs install`
4. For the first time, you should clone the existing repository to your local machine. On your terminal:

    ```bash
    git clone https://github.com/tanhl30/HE4045_Project.git
    ```

5. Change directory to the project folder and start working:

    ```bash
    cd HE4045_Project
    ```

### Pull, Push & Commit
1. Before starting work or when someone has made changes, sync your local repo with the latest changes from the remote repository:

    ```bash
    git pull origin main
    ```

2. Save your changes (Ctrl+S) after working on your file and stage all updates for commit:

    ```bash
    git add .
    ```

    If you created a new file, you should do this instead:

    ```bash
    git add "your file name"
    ```

3. Commit your changes with a meaningful message explaining what you've done:

    ```bash
    git commit -m "your commit message"
    ```

4. Push your committed changes to the remote repository:

    ```bash
    git push origin main
    ```

### Useful command lines 
1. Use `git status` to check the status of the project file, whether saved or unsaved.
2. Use `git remote` to check the current remote repository.
3. Use `git log` to check all previous commits.
4. Use `cd "your directory"` or `cd ..` to go back to the previous directory.
5. Use `ls` to list the files in the current directory.
6. Use `git  reset "file name"` to undo the staged changes (ie, undo the `git add`)
7. Use `git reset --HEAD~1` to undo the vommit changes (ie, undo the `git commit`) and go back to the previous commit (Be careful, this will delete all the changes you made after the commit)

### Good Resources
1. freecodecamp : https://www.youtube.com/watch?v=RGOj5yH7evk
2. github desktop and some concepts: https://www.youtube.com/watch?v=Oaj3RBIoGFc 
3. Chatgpt is very useful in teaching me haha