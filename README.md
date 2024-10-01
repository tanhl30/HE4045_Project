## How to do version control on this repo

### Getting started
1. Download Git at https://git-scm.com/downloads
2. Download GitBash at https://gitforwindows.org/
3. Download VScode at https://code.visualstudio.com/download, or you can use your preferred IDE and terminal.
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

3. Commit your changes with a meaningful message explaining what you've done:

    ```bash
    git commit -m "your commit message"
    ```

4. Push your committed changes to the remote repository:

    ```bash
    git push origin main
    ```

### Useful commands line 
1. Use `git status` to check the status of the project file, whether saved or unsaved.
2. Use `git remote` to check the current remote repository.
3. Instead of `master`, you could push to different branches such as `dev` or `test`.
4. Use `cd "your directory"` or `cd ..` to go back to the previous directory.
5. Use `ls` to list the files in the current directory.

### Good Resources
1. freecodecamp : https://www.youtube.com/watch?v=RGOj5yH7evk