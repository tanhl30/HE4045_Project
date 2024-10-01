## How to do version control on this repo

### Getting started
1. Download Git at https://git-scm.com/downloads
2. Download VScode at https://code.visualstudio.com/download, or you can use your preferred IDE and terminal.
3. Because our source data file is too big, we need to install https://git-lfs.com/. Once it is installed, initialize it at your terminal `git lfs install`
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

### Useful commands line 
1. Use `git status` to check the status of the project file, whether saved or unsaved.
2. Use `git remote` to check the current remote repository.
3. Use `git log` to check all previous commits.
4. Instead of `master`, you could push to different branches such as `dev` or `test`.
5. Use `cd "your directory"` or `cd ..` to go back to the previous directory.
6. Use `ls` to list the files in the current directory.

### Good Resources
1. freecodecamp : https://www.youtube.com/watch?v=RGOj5yH7evk
2. github desktop and some concepts: https://www.youtube.com/watch?v=Oaj3RBIoGFc 
3. Chatgpt is very useful in teaching me haha