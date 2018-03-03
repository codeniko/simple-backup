# simple-backup
A simple backup script. Place the shell file into a directory you want to backup and run. Backs up all files and directories where script is located. Useful for non-developers like designers.

## First time usage setup
You must first setup the environment. You only have to do this once.

1. Install `git` cli tool  
2. Install `git lfs` from https://git-lfs.github.com/
3. `chmod u+x simple-backup.sh` to set user executable permission on shell file

## Usage for each directory to backup
1. copy `simple-backup.sh` into directory where backup is needed.
2. create a github repository and make note of its name
3. `./simple-backup.sh` in the directory you want to backup

Alternatively, if you're not a developer or familiar with the terminal commands, you can do it all from Finder. Right click the `simple-backup.sh` file, and then select `Open with` in the menu. Choose `Utilities/Terminal` and select the box underneath to always open this type of file with the selected program. Then, whenever you want to backup your directory, simply double click the `simple-backup.sh` file.

## Instructions for large files
This script uses Git Large File Storage (git-lfs) which allows you to version control large files up to 2GB each. At the moment, it is set to only track files with the `.sketch` extension.
