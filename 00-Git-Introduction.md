
# Git introduction

[source-1](https://www.atlassian.com/git/tutorials/svn-to-git-prepping-your-team-migration)
[source-2](https://www.w3schools.com/git/git_branch.asp?remote=github)

Git is a popular version control system. It was created by Linus Torvalds in 2005, and has been maintained by Junio Hamano since then.

**It is used for**

- Tracking code changes
- Tracking who made changes
- Coding collaboration

**What does Git do?**

 - Clone a project to work on a local copy
 - Control and track changes with Staging and Committing
 - Branch and Merge to allow for work on different parts and versions of a project
 - Pull the latest version of the project to a local copy
 - Push local updates to the main project

**Working with Git**

 - Initialize Git on a folder, making it a Repository
 - Git now creates a hidden folder to keep track of changes in that folder
 - When a file is changed, added or deleted, it is considered modified
 - You select the modified files you want to Stage
 - The Staged files are Committed, which prompts Git to store a permanent snapshot of the files
 - Git allows you to see the full history of every commit.
 - You can revert back to any previous commit.
 - Git does not store a separate copy of every file in every commit, but keeps track of changes made in each commit

*What is GitHub?*

 - Git is not the same as GitHub.
 - GitHub makes tools that use Git.
 - GitHub is the largest host of source code in the world, and has been owned by Microsoft since 2018.
 - In this tutorial, we will focus on using Git with GitHub.


## Using Git with Command Line

to check if Git is properly installed:

*--version commands*

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ git --version
```

*Output*

```
git version 2.21.0.windows.1
```

### Creating Git Folder

- `mkdir` makes a new directory.
- `cd` changes the current working directory.

*mkdir commands*

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ mkdir gitlearning
```

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd gitlearning
```
### Initialize Git

Once you have navigated to the correct folder, you can initialize Git on that folder:

*init command*

```

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning
$ git init

```
*output*
```
Initialized empty Git repository in C:/Users/pkyadav/OneDrive - xxxxxx/Desktop/git/gitlearning/.git/

```

list the files in our current working directory:

*ls command*
```

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ ls
```

*output*
```
rearrange1.py*  rearrange2.py*
```
Then we check the Git status and see if it is a part of our repo

*status command* 
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git status
```
*output*

```
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        rearrange1.py
        rearrange2.py

nothing added to commit but untracked files present (use "git add" to track)

```
### Git Staging Environment

- One of the core functions of Git is the concepts of the Staging Environment, and the Commit.
- As you are working, you may be adding, editing and removing files. But whenever you hit a milestone or finish a part of the work, you should add the files to a Staging Environment.
- Staged files are files that are ready to be committed to the repository you are working on.

For now, we are done working with `rearrange1.py` & `rearrange1.py`. 
So we can add it to the *Staging Environment*:

*add command*
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git add rearrange1.py

```
*add command*
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git add rearrange2.py
```

The file should be Staged. Let's check the status::

*status command*
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git status
```
*output*
```
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   rearrange1.py
        new file:   rearrange2.py


```
**Git Add More than One File**

create a file `hellowWorld.py`

Now add all files in the current directory to the Staging Environment:

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git add --all
```
check status
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git status
```
*output*
```
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   hellowWorld.py
        new file:   rearrange1.py
        new file:   rearrange2.py

```

*Now all 3 files are added to the Staging Environment, and we are ready to do our first commit.*

*Note: The shorthand command for `git add --all` is `git add -A`*

### Git Commit

Since we have finished our work, we are ready move from stage to `commit` for our repo.

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git commit -m "First release"
```
*output*
```
[master (root-commit) 0e8d6c4] First release
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 3 files changed, 29 insertions(+)
 create mode 100644 hellowWorld.py
 create mode 100644 rearrange1.py
 create mode 100644 rearrange2.py
```

If we check status::

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git status
```
*Output*
```
On branch master
nothing to commit, working tree clean
```
### Git Commit without Stage
Sometimes, when you make small changes, using the staging environment seems like a waste of time. It is possible to commit changes directly, skipping the staging environment. The -a option will automatically stage every changed, already tracked file.

Now if we make a small change in `hellowWorld.py`

If we check status now::
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git status
```
*output*
```
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   hellowWorld.py

no changes added to commit (use "git add" and/or "git commit -a")
```

And check the status of our repository. But this time, we will use the --short option to see the changes in a more compact way:
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git status --short
```
*output*
```
 M hellowWorld.py
```

**Note: Short status flags are:**

	- ?? - Untracked files
	- A - Files added to stage
	- M - Modified files
	- D - Deleted files

We see the file we expected is modified. So let's commit it directly:

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git commit -a -m "helloworld.py updated with new line"
```
*output*
```
[master 10d3ae8] helloworld.py updated with new line
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 2 insertions(+), 1 deletion(-)
```


## Git Help
There are a couple of different ways you can use the help command in command line:

- `git command -help` -  See all the available options for the specific command
- `git help --all` -  See all possible commands


**Git -help See Options for a Specific Command**
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git commit -help
```
*output*
```
usage: git commit [<options>] [--] <pathspec>...

    -q, --quiet           suppress summary after successful commit
    -v, --verbose         show diff in commit message template

Commit message options
    -F, --file <file>     read message from file
    --author <author>     override author for commit
    --date <date>         override date for commit
    -m, --message <message>
                          commit message
    -c, --reedit-message <commit>
                          reuse and edit message from specified commit
    -C, --reuse-message <commit>
                          reuse message from specified commit
    --fixup <commit>      use autosquash formatted message to fixup specified commit
    --squash <commit>     use autosquash formatted message to squash specified commit
    --reset-author        the commit is authored by me now (used with -C/-c/--amend)
    -s, --signoff         add Signed-off-by:
    -t, --template <file>
                          use specified template file
    -e, --edit            force edit of commit
    --cleanup <default>   how to strip spaces and #comments from message
    --status              include status in commit message template
    -S, --gpg-sign[=<key-id>]
                          GPG sign commit

Commit contents options
    -a, --all             commit all changed files
    -i, --include         add specified files to index for commit
    --interactive         interactively add files
    -p, --patch           interactively add changes
    -o, --only            commit only specified files
    -n, --no-verify       bypass pre-commit and commit-msg hooks
    --dry-run             show what would be committed
    --short               show status concisely
    --branch              show branch information
    --ahead-behind        compute full ahead/behind values
    --porcelain           machine-readable output
    --long                show status in long format (default)
    -z, --null            terminate entries with NUL
    --amend               amend previous commit
    --no-post-rewrite     bypass post-rewrite hook
    -u, --untracked-files[=<mode>]
                          show untracked files, optional modes: all, normal, no. (Default: all)
```

**Git help --all See All Possible Commands**
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git help --all
```
*command*
```
See 'git help <command>' to read about a specific subcommand

Main Porcelain Commands
   add                  Add file contents to the index
   am                   Apply a series of patches from a mailbox
   archive              Create an archive of files from a named tree
   bisect               Use binary search to find the commit that introduced a bug
   branch               List, create, or delete branches
   bundle               Move objects and refs by archive
   checkout             Switch branches or restore working tree files
   cherry-pick          Apply the changes introduced by some existing commits
   citool               Graphical alternative to git-commit
   clean                Remove untracked files from the working tree
   clone                Clone a repository into a new directory
   commit               Record changes to the repository
   describe             Give an object a human readable name based on an available ref
   diff                 Show changes between commits, commit and working tree, etc
   fetch                Download objects and refs from another repository
   format-patch         Prepare patches for e-mail submission
   gc                   Cleanup unnecessary files and optimize the local repository
   gitk                 The Git repository browser
   grep                 Print lines matching a pattern
   gui                  A portable graphical interface to Git
   init                 Create an empty Git repository or reinitialize an existing one
   log                  Show commit logs
   merge                Join two or more development histories together
   mv                   Move or rename a file, a directory, or a symlink
   notes                Add or inspect object notes
   pull                 Fetch from and integrate with another repository or a local branch
   push                 Update remote refs along with associated objects
   range-diff           Compare two commit ranges (e.g. two versions of a branch)
   rebase               Reapply commits on top of another base tip
   reset                Reset current HEAD to the specified state
   revert               Revert some existing commits
   rm                   Remove files from the working tree and from the index
   shortlog             Summarize 'git log' output
   show                 Show various types of objects
   stash                Stash the changes in a dirty working directory away
   status               Show the working tree status
   submodule            Initialize, update or inspect submodules
   tag                  Create, list, delete or verify a tag object signed with GPG
   worktree             Manage multiple working trees

Ancillary Commands / Manipulators
   config               Get and set repository or global options
   fast-export          Git data exporter
   fast-import          Backend for fast Git data importers
   filter-branch        Rewrite branches
   mergetool            Run merge conflict resolution tools to resolve merge conflicts
   pack-refs            Pack heads and tags for efficient repository access
   prune                Prune all unreachable objects from the object database
   reflog               Manage reflog information
   remote               Manage set of tracked repositories
   repack               Pack unpacked objects in a repository
   replace              Create, list, delete refs to replace objects

Ancillary Commands / Interrogators
   annotate             Annotate file lines with commit information
   blame                Show what revision and author last modified each line of a file
   count-objects        Count unpacked number of objects and their disk consumption
   difftool             Show changes using common diff tools
   fsck                 Verifies the connectivity and validity of the objects in the database
   gitweb               Git web interface (web frontend to Git repositories)
   help                 Display help information about Git
   instaweb             Instantly browse your working repository in gitweb
   merge-tree           Show three-way merge without touching index
   rerere               Reuse recorded resolution of conflicted merges
   show-branch          Show branches and their commits
   verify-commit        Check the GPG signature of commits
   verify-tag           Check the GPG signature of tags
   whatchanged          Show logs with difference each commit introduces

Interacting with Others
   archimport           Import a GNU Arch repository into Git
   cvsexportcommit      Export a single commit to a CVS checkout
   cvsimport            Salvage your data out of another SCM people love to hate
   cvsserver            A CVS server emulator for Git
   imap-send            Send a collection of patches from stdin to an IMAP folder
   p4                   Import from and submit to Perforce repositories
   quiltimport          Applies a quilt patchset onto the current branch
   request-pull         Generates a summary of pending changes
   send-email           Send a collection of patches as emails
   svn                  Bidirectional operation between a Subversion repository and Git

Low-level Commands / Manipulators
   apply                Apply a patch to files and/or to the index
   checkout-index       Copy files from the index to the working tree
   commit-graph         Write and verify Git commit-graph files
   commit-tree          Create a new commit object
   hash-object          Compute object ID and optionally creates a blob from a file
   index-pack           Build pack index file for an existing packed archive
   merge-file           Run a three-way file merge
   merge-index          Run a merge for files needing merging
   mktag                Creates a tag object
   mktree               Build a tree-object from ls-tree formatted text
   multi-pack-index     Write and verify multi-pack-indexes
   pack-objects         Create a packed archive of objects
   prune-packed         Remove extra objects that are already in pack files
   read-tree            Reads tree information into the index
   symbolic-ref         Read, modify and delete symbolic refs
   unpack-objects       Unpack objects from a packed archive
   update-index         Register file contents in the working tree to the index
   update-ref           Update the object name stored in a ref safely
   write-tree           Create a tree object from the current index

Low-level Commands / Interrogators
   cat-file             Provide content or type and size information for repository objects
   cherry               Find commits yet to be applied to upstream
   diff-files           Compares files in the working tree and the index
   diff-index           Compare a tree to the working tree or index
   diff-tree            Compares the content and mode of blobs found via two tree objects
   for-each-ref         Output information on each ref
   get-tar-commit-id    Extract commit ID from an archive created using git-archive
   ls-files             Show information about files in the index and the working tree
   ls-remote            List references in a remote repository
   ls-tree              List the contents of a tree object
   merge-base           Find as good common ancestors as possible for a merge
   name-rev             Find symbolic names for given revs
   pack-redundant       Find redundant pack files
   rev-list             Lists commit objects in reverse chronological order
   rev-parse            Pick out and massage parameters
   show-index           Show packed archive index
   show-ref             List references in a local repository
   unpack-file          Creates a temporary file with a blob's contents
   var                  Show a Git logical variable
   verify-pack          Validate packed Git archive files

Low-level Commands / Synching Repositories
   daemon               A really simple server for Git repositories
   fetch-pack           Receive missing objects from another repository
   http-backend         Server side implementation of Git over HTTP
   send-pack            Push objects over Git protocol to another repository
   update-server-info   Update auxiliary info file to help dumb servers

Low-level Commands / Internal Helpers
   check-attr           Display gitattributes information
   check-ignore         Debug gitignore / exclude files
   check-mailmap        Show canonical names and email addresses of contacts
   check-ref-format     Ensures that a reference name is well formed
   column               Display data in columns
   credential           Retrieve and store user credentials
   credential-cache     Helper to temporarily store passwords in memory
   credential-store     Helper to store credentials on disk
   fmt-merge-msg        Produce a merge commit message
   interpret-trailers   add or parse structured information in commit messages
   mailinfo             Extracts patch and authorship from a single e-mail message
   mailsplit            Simple UNIX mbox splitter program
   merge-one-file       The standard helper program to use with git-merge-index
   patch-id             Compute unique ID for a patch
   sh-i18n              Git's i18n setup code for shell scripts
   sh-setup             Common Git shell script setup code
   stripspace           Remove unnecessary whitespace

External commands
   flow
   lfs
(END)

```
`Note: If you find yourself stuck in the list view, SHIFT + G to jump the end of the list, then q to exit the view.`


## Git Branch

In Git, a `branch` is a new/separate version of the main repository.

Git branches are effectively a pointer to a snapshot of your changes. When you want to add a new feature or fix a bug—no matter how big or how small—you spawn a new branch to encapsulate your changes. This makes it harder for unstable code to get merged into the main code base, and it gives you the chance to clean up your future's history before merging it into the main branch.

![](https://wac-cdn.atlassian.com/dam/jcr:a905ddfd-973a-452a-a4ae-f1dd65430027/01%20Git%20branch.svg?cdnVersion=1450)



### git log
he `git log` command displays committed snapshots. It lets you list the project history, filter it, and search for specific changes. While `git status` lets you inspect the working directory and the staging area, `git log` only operates on the committed history.

*`git log`*

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git log
```
*output*
```
commit 10d3ae84d9b0f95d976ab67d8664e500354fca14 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 17:19:40 2024 +0530

    helloworld.py updated with new line

commit 0e8d6c4a13c242bf1feeb90c0c3bc43f2f9a6b1f
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 16:53:58 2024 +0530

    First release

```
*`git log -n <limit>`*

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git log -n 1
```
*output*
```
commit 10d3ae84d9b0f95d976ab67d8664e500354fca14 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 17:19:40 2024 +0530

    helloworld.py updated with new line
```

*`git log --oneline`*
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git log --oneline
```
*output*
```
10d3ae8 (HEAD -> master) helloworld.py updated with new line
0e8d6c4 First release
```
*`git log --stat`*

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git log --stat
```
*output*
```
commit 10d3ae84d9b0f95d976ab67d8664e500354fca14 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 17:19:40 2024 +0530

    helloworld.py updated with new line

 hellowWorld.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

commit 0e8d6c4a13c242bf1feeb90c0c3bc43f2f9a6b1f
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 16:53:58 2024 +0530

    First release

 hellowWorld.py |  1 +
 rearrange1.py  | 14 ++++++++++++++
 rearrange2.py  | 14 ++++++++++++++
 3 files changed, 29 insertions(+)

```

**`git log -p`**: Display the patch representing each commit. This shows the full diff of each commit, which is the most detailed view you can have of your project history.

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git log -p
```
```
commit 10d3ae84d9b0f95d976ab67d8664e500354fca14 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 17:19:40 2024 +0530

    helloworld.py updated with new line

diff --git a/hellowWorld.py b/hellowWorld.py
index 442659b..ec8af5c 100644
--- a/hellowWorld.py
+++ b/hellowWorld.py
@@ -1 +1,2 @@
-print("Hello world!")
\ No newline at end of file
+print("Hello world!")
+print("change")
\ No newline at end of file

commit 0e8d6c4a13c242bf1feeb90c0c3bc43f2f9a6b1f
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 16:53:58 2024 +0530

    First release

diff --git a/hellowWorld.py b/hellowWorld.py
new file mode 100644
index 0000000..442659b
--- /dev/null
+++ b/hellowWorld.py
@@ -0,0 +1 @@
+print("Hello world!")
\ No newline at end of file
diff --git a/rearrange1.py b/rearrange1.py
new file mode 100644
index 0000000..67b01c5
--- /dev/null
+++ b/rearrange1.py
@@ -0,0 +1,14 @@
+#!/usr/bin/env python3
+
+import re
+
+def rearrange_name(name):
+
+    result = re.search(r"^([\w .]*), ([\w .]*)$", name)
+
+    if result == None:
+
+        return name
+
+    return "{} {}".format(result[2], result[1])
+
\ No newline at end of file
diff --git a/rearrange2.py b/rearrange2.py
new file mode 100644
index 0000000..d238d25
--- /dev/null
+++ b/rearrange2.py
@@ -0,0 +1,14 @@
+#!/usr/bin/env python3
+
+import re
+
+def rearrange_name(name):
+
+    result = re.search(r"^([\w .-]*), ([\w .-]*)$", name)
+
+    if result == None:
+
+        return name
+
+
+    return "{} {}".format(result[2], result[1])
\ No newline at end of file

xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$

```
`git log --author="<pattern>"`:
`git log --grep="<pattern>"`:
`git log <since>..<until>`:
`git log <file>`:

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git log hellowWorld.py
```
*output*
```
commit 10d3ae84d9b0f95d976ab67d8664e500354fca14 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 17:19:40 2024 +0530

    helloworld.py updated with new line

commit 0e8d6c4a13c242bf1feeb90c0c3bc43f2f9a6b1f
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sat Feb 17 16:53:58 2024 +0530

    First release
```
`git log --graph --decorate --oneline`:

## Git blame

The `git blame` command is a versatile troubleshooting utility that has extensive usage options. The high-level function of `git blame` is the display of author metadata attached to specific committed lines in a file. This is used to examine specific points of a file's history and get context as to who the last author was that modified the line. This is used to explore the history of specific code and answer questions about what, how, and why the code was added to a repository.

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ git blame hellowWorld.py
```
```
10d3ae84 (Kumar Yadav 2024-02-17 17:19:40 +0530 1) print("Hello world!")
10d3ae84 (Kumar Yadav 2024-02-17 17:19:40 +0530 2) print("change")


```

## Diffing Files

*ls commands*
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ ls
```

*Output*
```
Git-Introduction.txt  rearrange1.py*  rearrange2.py*
```
*cat commands*
```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cat rearrange1.py
```
*Output*
```
#!/usr/bin/env python3

import re

def rearrange_name(name):

    result = re.search(r"^([\w .]*), ([\w .]*)$", name)

    if result == None:

        return name

    return "{} {}".format(result[2], result[1])
```

*cat command*
```

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cat rearrange2.py
```
*Output*

```
##!/usr/bin/env python3

import re

def rearrange_name(name):

    result = re.search(r"^([\w .-]*), ([\w .-]*)$", name)

    if result == None:

        return name


    return "{} {}".format(result[2], result[1])
```

*diff command*

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ diff rearrange1.py rearrange2.py
```
*Output*

```
$ diff rearrange1.py rearrange2.py
7c7
<     result = re.search(r"^([\w .]*), ([\w .]*)$", name)
---
>     result = re.search(r"^([\w .-]*), ([\w .-]*)$", name)
13,14c13,14
<     return "{} {}".format(result[2], result[1])
<
\ No newline at end of file
---
>
>     return "{} {}".format(result[2], result[1])
\ No newline at end of file

```

*diff command in unified format*

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ diff -u rearrange1.py rearrange2.py
```

*Output*

```
--- rearrange1.py       2024-02-17 15:31:53.507994500 +0530
+++ rearrange2.py       2024-02-17 15:32:33.391854400 +0530
@@ -4,11 +4,11 @@

 def rearrange_name(name):

-    result = re.search(r"^([\w .]*), ([\w .]*)$", name)
+    result = re.search(r"^([\w .-]*), ([\w .-]*)$", name)

     if result == None:

         return name

-    return "{} {}".format(result[2], result[1])
-
\ No newline at end of file
+
+    return "{} {}".format(result[2], result[1])
\ No newline at end of file
```
