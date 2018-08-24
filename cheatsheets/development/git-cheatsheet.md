git-cheatsheet
===================

A cheatsheet on the usage of git.

* [Git Cheatsheet](#git-cheatsheet)
    * [Branches and checkout](#branches-and-checkout)
    * [Adding (staging)](#adding-staging)
    * [Commit](#commit)
    * [Merging](#merging)
      * [Dealing with conflicts](#dealing-with-conflicts)
      * [Merge keeping certain files](#merge-keeping-certain-files)
    * [Log](#log)
    * [Diff](#diff)
    * [Stash](#stash)
    * [Undoing and restoring](#undoing-and-restoring)
    * [Tags](#tags)
    * [Setup](#setup)
      * [Config](#config)
      * [Create new repository](#create-new-repository)
      * [Clone an existing repository](#clone-an-existing-repository)
      * [Submodules](#submodules)
      * [Local environment](#local-environment)
      * [Apache](#apache)
      * [Gitignore](#gitignore)
   * [Tricks](#tricks)
      * [Ninja style push-pull](#ninja-style-push-pull)  
      * [Database schema hook](#database-schema-hook)


## Branches and checkout
```sh
# show branches
git branch
# show unmerged branches
git branch --no-merged
# check out branch "my-branch"
git checkout my-branch 
# create a branch and checkout
git checkout -b my-branch 
# check out file from other branch
git checkout other-branch /path/to/file
# delete local branch
git branch -d my-branch
# push local branch upstream
git push -u origin my-branch 
# list branches showing date (I usually alias this command in ~/.gitconfig: git branchlog)
git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'
```
## Adding (staging)
```sh
# add these files
git add path/file1 path/file2
# add all new untracked files in current path
git add .
# add all deleted files in current path
git add -u .
# add all new untracked and deleted files in current path
git add -A
# unstage all added files
git reset 
```
## Commit
```sh
# Commit staged changes
git commit
# Stage and commit
git commit -a 
# Fix last commit, forgot to add files, typo in message etc.
git commit --amend
# See what will happen
git commit --dry-run 
# List unpushed commits
git cherry -v 
# Push all unpushed commits upstream
git push 
```
## Merging
```sh
# fetch and merge from upstream branch
git pull
# merge other branch into current branch
git merge other-branch
# pick specific files from another branch
git checkout other-branch path/file1 path/file2
# Automatically resolve conflicts with our version, "theirs" for the other branch
git merge --strategy-option ours other-branch 
# squash all commits to one big before merge. Don't use if you intend to merge back...
git merge --squash other-branch 
```
### Dealing with conflicts


Fix conflicts manually by editing the file (or using some fancy merge tool), or, if the conflict is simple:
```sh
# Option 1, the correct file is in the other branch:
git checkout --theirs path/to/file
# Option 2, the correct file is in this branch
git checkout --ours path/to/file
# Option 3
# Abort the merge, then
git merge --abort
# Automatically resolve conflicts to "ours" (or "theirs")
git merge --strategy-option ours other-branch 
# Finish the merge by adding and committing
```
I changed my mind, I don't want to merge yet:
```sh
# abort merge process, revert to pre-merge situation
git merge --abort 
```
### Merge keeping certain files
Ok, so you want to merge in another branch, but you have some content you want to keep:

First do
```
# Adds properties to ~/.gitconfig
git config --global merge.ours.driver true 
```
The create the file `.gitattributes` in your repo, adding for example:
```sh
#file: .gitattributes
content/** merge=ours
app/app.html merge=ours
.gitignore merge=ours
```
Now you can merge without these files being overwritten.

## Log
```sh
# Concise with times
git log --pretty=format:"%h%x09%an%x09%ad%x09%s" 
# List commits in current branch
git log
# List commits from another branch
git log other-branch
# All commits for specific file
git log --follow path/to/file
# Display file contents one commit back
git show HEAD~1:path/to/file 
# Display file contents specific commit
git show 835a0edccd:path/to/file 
# Find string 'foobar' in history
git log -S'foobar' 
# Find string 'foobar' in history of specific file
git log -S'foobar' -- path/to/file 

```
## Diff
```sh
# Show changes since last commit
git diff
# Show diff between branches
git diff my-branch other-branch
# Specific file
git diff other-branch -- path/to/file
# List files with differences in another branch
git diff --name-status other-branch 
# List unpushed commits
git cherry -v 
```
## Stash
Stashing is useful when you want to temporary clean up modified files in your repo.
```sh
# Stash uncommitted files, clean up working directory 
git stash 
# Apply the stash to the current branch
git stash apply
# Short for stash, checkout new branch, apply
git stash branch newbranch 
# List stashes
git stash list
# Apply second stash in list
git stash apply stash@{2} 
# Un-apply last applied stash
git stash show -p | git apply -R 
# Un-apply specific stash
git stash show -p stash@{0} | git apply -R 
```
## Undoing and restoring
Git is fantastic for undoing things and restoring from its unlimited history, but only if you've told git about the changes you've made. Commit frequently!

**Undo accidental commit**

When you did `git commit -a` and meant just to commit a single staged file. Or committed to the wrong branch.
```sh
git reset HEAD~ # Undo last commit, unstage changed files
git reset --soft HEAD~ # As above, but leave the files staged. If you only want to change the message or something.
```

**Getting pre-restore info**
```sh
# List commits and get keys (eg. 835a0edccd) to copy-paste
git log 
# All commits for specific file
git log --follow path/to/file
# Display file contents specific commit
git show 835a0edccd:path/to/file 
```
**Unstaged files**
```sh
# unstage added files
git reset
# Discard uncommited changes
git stash
```
**Restore specific files**
```sh
# Get file from this commit, then: git commit
git checkout 835a0edccd -- path/to/file 
# Restore file deleted in this commit. The caret (^) means "as it was before committing", e.g. before the file was deleted
git checkout 835a0edccd^ -- path/to/file 
# pick specific files from another branch
git checkout other-branch path/file1 path/file2 
```
**Revert to or restore a specific commit**
```sh
# pick a specific commit from another branch
git cherry-pick 2e744aba6c 
# Revert to this commit without losing your history. Safest way to restore.
git revert 835a0edccd 
# As with merge --abort, this lets you abort the process if it doesn't look good
git revert --abort
# Check out a new branch created from this commit
git checkout -b newbranch 835a0edccd
# Reset to this commit. Removes subsequent commits, use revert if unsure.
git reset --hard 835a0edccd 
```
**Revert to upstream situation **
```sh
# fetch everything from upstream 
git fetch origin 
# Reset to this
git reset --hard origin/master 

```
## Tags
Tags are good for release version numbers.
```sh
# list tags
git tag
git tag -a v1.4 -m "My version 1.4"
# push tags, pull --tags to pull
git push --tags 
```
For npm projects, there's a cool auto versioning tool that both creates a git tag and updates the version of package.json. See https://docs.npmjs.com/cli/version
```sh
npm install version
# Bump the patch version e.g. 1.4.1 => 1.4.2 ( patch | minor | major )
npm version patch -m "My new patch" 
# Bump the version explicitly. %s is a mask for the version
npm version v1.5.0 -m "My new version %s" 
```
## Setup 

### Config
```sh
# add some color to all the git output:
git config --global color.ui true
# alias to display one liner history/log changes(Usage: git lol)
git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
# Aliases
Put aliases for useful commands in `~/.gitconfig`
[alias]
    branchdiff = diff --name-status
    prettylog = log --pretty=format:"%h%x09%an%x09%ad%x09%s"
    branchlog = for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'
    lol = log --pretty=oneline --abbrev-commit --graph --decorate 
```

### Create new repository 
Create the new repo on Bitbucket/Github, copy-paste the instructions from there or do:
```sh
cd /path/to/your/project
git init 
git remote add origin git@github.com:me/newrepo.git
# Do this now if you already have some files. Example below.
nano .gitignore 
# add everything. Too many files? git reset, edit .gitignore, add again
git add .
# Initial commit
git commit
# First push
git push -u origin --all 
```
Whoops, did I set the wrong upstream url?
```
# List upstream repos
git remote -v 
git remote set-url origin git@github.com:me/correct-repo.git
```
### Clone an existing repository
Copy the cloning address from Github/Bitbucket, choose *ssh* for repos you intend to commit to and have uploaded your SSH key to, *https* for repos you only want to use or don't have write permissions to. 
```sh
cd /path/to/dir
# ssh:
git clone git@github.com:me/somerepo.git 
# https:
git clone https://me@github.com/me/somerepo.git
```
Cloning will create a directory for the repo, so do this from the path you want the repo to reside in.

Clone just one remote branch into a new repository
```
git clone git@github.com:me/somerepo.git -b some-branch --single-branch /path/to/new_repo
```
### Submodules

Add a submodule to a repo (assuming the submodule already has an upstream repo):
```
~/myrepo/$ git submodule add git@github.com:me/mysubmod.git mysub # will add subdirectory ~/myrepo/mysubmod
```
Breakout existing dir into submodule (dir is named `app` in this example):

```
~/my_repo$ mv app ~/app_tmp # move Move "app" out the repo
~/my_repo$ git commit -a # Commit the deletion af "app"

# Go to github/bitbucket, greate a new repo "mysubmod"
# Then go to the moved folder and init the repo there:
~/app_tmp$ git init; git add .; git commit # The usual stuff, add .gitignore if needed
~/app_tmp$ git remote add origin git@github.com:me/mysubmod.git 
~/app_tmp$ git push -u origin master

# If the submodule repo looks ok upstream, go back to the original repo:
~/my_repo$ git submodule add git@github.com:me/mysubmod.git app # Clones the repo into app
~/my_repo$ git commit -a
~/my_repo$ git push
```

Clone repo with submodule:
```
git clone git@github.com:me/myrepo.git --recursive

# Submodule is in detached head mode, so checkout branch if you want to commit something:
~/myrepo/$ cd mysubmod
~/myrepo/mysubmod$ git checkout master 

# if you forgot to clone --recursive, you can do:
~/myrepo/$ git submodule update --init --recursive
```


See also:    
https://github.com/blog/2104-working-with-submodules 
https://git-scm.com/book/en/v2/Git-Tools-Submodules
https://chrisjean.com/git-submodules-adding-using-removing-and-updating/

### Local environment
Make the current branch visible in the prompt (Ubuntu/Debian). In `~/.bashrc` (somewhere before the prompt line) do:
```sh
# Include the git-prompt (this isn't needed on some systems, but safe to do)
source /etc/bash_completion.d/git-prompt

# Show dirty state with * like this: (master *)$
export GIT_PS1_SHOWDIRTYSTATE=1
```
Then add `$(__git_ps1)` to the end of the prompt line, something like:
```sh
PS1='${debian_chroot:[ ... ] \w\[\033[00m\]$(__git_ps1)\$ '
```
Uncomment the line `force_color_prompt=yes` while you're at it.


### Gitignore
Some basic excludes, save as `.gitignore` in your repo root.
```sh
*.orig
*.bak
*.log
*~
# npm projects
node_modules
bower_components
# Visual Studio Code metadata
.vscode
# Railo or Coldfusion metadata
WEB-INF
# For TypeScript projects like Angular2
app/**/*.js
app/**/*.map
```
Sometimes you want to start ignoring files you've earlier tracked with git. Adding a line to gitignore won't be enough in this case, you also have to remove it from git's index with:
```
git rm --cached file/to/ignore
git rm -r 'app/*.js' # recursive wildcard, note single quotes
```
The `--cached` flag means "remove from git index only, don't remove from filesystem".

## Misc Tricks

### Ninja style push-pull
When working on a web server with a devel and a production repo side by side, and you get bored with doing this all the time:
```sh
www/site_devel (master)$ git push
# wait...
www/site_devel (master)$ cd ../site
www/site (master)$ git pull
# wait...
www/site (master)$ cd ../site_devel/
```
Instead, you could use my *push-pull*-script, and simply do:
```sh
www/site_devel (master)$ git pushpull
```
The script shows which commits will be pushed and checks that you are in the correct dir and branch. The script is located at: https://github.com/subsite/misc-scripts/blob/master/pushpull

### Database schema-hook

Wouldn't it be nice to have the changes you've made to the database included in the commit? One way is to dump the schema to a file in a pre-commit hook. (PostgreSQL shown here, for MySQL, look into the command `mysqldump --no-data`)

For a more manageable dump, you could use a script to split the dump into chunks by database object. This one here, for instance: https://github.com/subsite/misc-scripts/blob/master/split_pgdump.php

Save the following in your repo as `.git/hooks/pre-commit` (or add to it if it exists):
```sh
#!/bin/sh

## Dump database schema
db_database="database_name"          # The database to dump
db_user="database_user"              # The database user (password in ~/.pgpass)
db_schemafile="database/database_schema.sql"; # File to contain the schema, relative to repo root
db_outdir="database/schema_files"    # OPTIONAL, for split_pgdump only
#
echo "Updating $db_schemafile"
db_schemafile="$(git rev-parse --show-toplevel)/$db_schemafile"
pg_dump -h localhost -U $db_user -s -f "$db_schemafile" $db_database
git add "$db_schemafile"        

# OPTIONAL, for split_pgdump only
split_pgdump.php $db_schemafile $db_outdir
git add $db_outdir/*

## Dump database schema DONE
```
# adding and committing
```
git add -A                        # stages All
git add .                         # stages new and modified, without deleted
git add -u                        # stages modified and deleted, without new
git commit --amend                # Add staged changes to previous commit. Do not use if commit has been pushed.
git commit --amend --no-edit      # Do so without having to edit the commit message.
```

# remotes - pushing, pulling, and tracking
```
git fetch                         # gets remote objects and refs. Needed if new branches were added on the remote.
git remote -v                     # Lists all remotes (verbose)
git pull origin master            # Pulls commits from the 'origin' remote's master branch and stores them in the local repo
git push -u origin master         # sets ups tracking so that you can 'git push' without extra args
git show :/^Merge                 # show the last commit whose message matches a regex
```

# branches - creating, checking out, and merging
```
git branch                        # list branches
git branch -a                     # list branches including remotes
git branch <MYBRANCH>             # Creates a new branch called "MYBRANCH"
git checkout <MYBRANCH>           # Makes MYBRANCH the active branch
git checkout -b <MYBRANCH>        # create and checkout a new branch
git branch -d <MYBRANCH>          # delete a local branch
git branch -m <MYBRANCH>          # rename the current branch
git checkout --track origin/<MYBRANCH>      # create a new local branch with the same name as the remote and set "upstream" configuration
git merge <MYBRANCH>           # merge the commits from the given branch into the current branch
```

# tagging
```
git tag                           # list available tags
git tag -l v1.4.2.*               # search for specific tags
git tag -a v1.4 -m 'version 1.4'  # create an annotated tag
git tag -a v1.2 9fceb02           # tag a specific commit (if you forgot)
git show v1.4                     # show the tag data of a specific tag
git tag v1.4                      # create a lightweight tag
git push --tag                    # you have to explicitly push tags to remotes
git log --date-order --graph --tags --simplify-by-decoration --pretty=format:'%ai %h %d' # show tags with creation dates
```

# diff
```
git diff --word-diff
git diff --staged                 # show the changes that have been staged
git diff 0c6de32 HEAD             # compare the current commit to a previous commit
```

# reset
```
git reset <FILE_OR_DIRECTORY>     # unstage
git checkout -- <FILE>            # throw away local modifications and reset to last committed version of given file
git checkout 0c6de32              # browse a previous commit in detached HEAD state. git checkout master to reattach.
git reset --hard HEAD             # throw away local modifications and reset to latest of current branch
git reset --hard 0c6de32          # throw away local modifications and reset to specific commit
git clean -f                      # remove untracked files
git revert HEAD                   # Make a commit that undoes the last commit. Used to reset a commit that
                                  # has already been pushed to a remote.
 
git rm FILE                       # Remove a file from the index
git rm -r FOLDER                  # Remove a folder from the index
```
# *these are useful if you forgot to create a .gitignore before adding files*
 
# checkout prev (older) revision
```
git_prev() {
    git checkout HEAD~
}
```
 
# checkout next (newer) commit
```
git_next() {
    BRANCH=`git show-ref | grep $(git show-ref -s -- HEAD) | sed 's|.*/\(.*\)|\1|' | grep -v HEAD | sort | uniq`
    HASH=`git rev-parse $BRANCH`
    PREV=`git rev-list --topo-order HEAD..$HASH | tail -1`
    git checkout $PREV
}
```

# create a new repo from a directory in an old repo, preserving history
```
git clone <old repo>
cd <old repo>
git remote rm origin
git filter-branch --subdirectory-filter <new repo> -- --all
cd <new repo>
curl -u '<username>' https://api.github.com/user/repos -d '{"name":"<new repo>"}'
git remote add origin <new repo>
git push origin master
``` 

# display branches sorted by date
```
git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate) %(authorname) %(refname:short)'
```
 
# Other Awesomeness: http://hub.github.com
