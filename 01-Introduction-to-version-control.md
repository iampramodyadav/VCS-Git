
# Git Tutorial

## Diffing Files

*ls commands*
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ ls
```

*Output*
```console
Git-Introduction.txt  rearrange1.py*  rearrange2.py*
```
*cat commands*
```console
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
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cat rearrange2.py
```
*Output*
```console
##!/usr/bin/env python3

import re

def rearrange_name(name):

    result = re.search(r"^([\w .-]*), ([\w .-]*)$", name)

    if result == None:

        return name


    return "{} {}".format(result[2], result[1])
```

*diff command*
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ diff rearrange1.py rearrange2.py
```
*Output*
```console
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
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ diff -u rearrange1.py rearrange2.py
```
*Output*
```console
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

## Applying Changes

- When you change someone else code, this could be hard for them to understand if the code is complex. 
- To make the change clear, you could send them a diff with the change so that they can see what the modified code looks like. 
- To do this, we typically use a command line like `diff-u old_file new_ file > change.diff`. 
- As a reminder, the greater than sign redirects the output of the diff command to a file. 
- So with this command, we're generating a file called `change.diff` with the contents of `diff-u` command
- code our colleague was using to prepare the fix wasn't the latest version.
- By using a `diff` instead of the whole file, we can clearly see what they changed, no matter which version they were using. 
- The `patch` command can detect that there were changes made to the file and will do its best to apply the diff anyways.


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat cpu_usage.py
```
*output* : file before
```console
#!/usr/bin/env python3
import psutil

def check_cpu_usage(percent):
    usage = psutil.cpu_percent()
    return usage < percent

if not check_cpu_usage(75):
    print("ERROR! CPU is overloaded")
else:
    print("Everything ok")

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat cpu_usage.diff
```
*output*: diff file
```console
--- cpu_usage.py        2019-06-23 08:16:04.666457429 -0700
+++ cpu_usage_fixed.py  2019-06-23 08:15:37.534370071 -0700
@@ -2,7 +2,8 @@
 import psutil

 def check_cpu_usage(percent):
-    usage = psutil.cpu_percent()
+    usage = psutil.cpu_percent(1)
+    print("DEBUG: usage: {}".format(usage))
     return usage < percent

 if not check_cpu_usage(75):
```
*'patch'*: to apply diff (change) in file
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ patch cpu_usage.py < cpu_usage.diff
```
*output*
```console
(Stripping trailing CRs from patch; use --binary to disable.)
patching file cpu_usage.py
patch unexpectedly ends in middle of line
Hunk #1 succeeded at 2 with fuzz 1.

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat cpu_usage.py
```
*output*: file after diff applied
```console
#!/usr/bin/env python3
import psutil

def check_cpu_usage(percent):
    usage = psutil.cpu_percent(1)
    print("DEBUG: usage: {}".format(usage))
    return usage < percent

if not check_cpu_usage(75):
    print("ERROR! CPU is overloaded")
else:
    print("Everything ok")

```

## Practical use of diff and patch

lets we have `disk_usage.py` with few bugs,

```py
#!/usr/bin/env python3

import shutil

def check_disk_usage(disk, min_absolute, min_percent):
    """Returns True if there is enough free disk space, false otherwise."""
    du = shutil.disk_usage(disk)
    # Calculate the percentage of free space
    percent_free = 100 * du.free / du.total
    # Calculate how many free gigabytes
    gigabytes_free = du.free / 2**30
    if percent_free < min_percent or gigabytes_free < min_absolute:
        return False
    return True

# Check for at least 2 GB and 10% free
if not check_disk_usage("/", 2*2**30, 10):
    print("ERROR: Not enough disk space")
    return 1

print("Everything ok")
return 0

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat disk_usage.py
```
*output*:
```console
#!/usr/bin/env python3

import shutil

def check_disk_usage(disk, min_absolute, min_percent):
    """Returns True if there is enough free disk space, false otherwise."""
    du = shutil.disk_usage(disk)
    # Calculate the percentage of free space
    percent_free = 100 * du.free / du.total
    # Calculate how many free gigabytes
    gigabytes_free = du.free / 2**30
    if percent_free < min_percent or gigabytes_free < min_absolute:
        return False
    return True

# Check for at least 2 GB and 10% free
if not check_disk_usage("/", 2*2**30, 10):
    print("ERROR: Not enough disk space")
    return 1

print("Everything ok")
return 0
```


- first lets make copy of file

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cp disk_usage.py disk_usage_ori.py

xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cp disk_usage.py disk_usage_fix.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat disk_usage_fix.py
```
*output*:
```console
#!/usr/bin/env python3

import shutil

def check_disk_usage(disk, min_absolute, min_percent):
    """Returns True if there is enough free disk space, false otherwise."""
    du = shutil.disk_usage(disk)
    # Calculate the percentage of free space
    percent_free = 100 * du.free / du.total
    # Calculate how many free gigabytes
    gigabytes_free = du.free / 2**30
    if percent_free < min_percent or gigabytes_free < min_absolute:
        return False
    return True

# Check for at least 2 GB and 10% free
if not check_disk_usage("/", 2*2**30, 10):
    print("ERROR: Not enough disk space")
    return 1

print("Everything ok")
return 0
```

When we run `disk_usage_fixed.py ` it gives error
```py
    return 1
    ^
SyntaxError: 'return' outside function
```

- When we fix the code `isk_usage_fixed.py`

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat disk_usage_fix.py
```
*output*
```console
#!/usr/bin/env python3

import shutil
import sys

def check_disk_usage(disk, min_absolute, min_percent):
    """Returns True if there is enough free disk space, false otherwise."""
    du = shutil.disk_usage(disk)
    # Calculate the percentage of free space
    percent_free = 100 * du.free / du.total
    # Calculate how many free gigabytes
    gigabytes_free = du.free / 2**30
    if percent_free < min_percent or gigabytes_free < min_absolute:
        return False
    return True

# Check for at least 2 GB and 10% free
if not check_disk_usage("/", 2*2**30, 10):
    print("ERROR: Not enough disk space")
    sys.exit(1)

print("Everything ok")
sys.exit(0)

```
-  now if we run this

Code output:
`ERROR: Not enough disk space`

- diff in files

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ diff -u disk_usage_ori.py disk_usage_fix.py
```
*output*
```console
--- disk_usage_ori.py   2024-02-17 21:08:27.157126400 +0530
+++ disk_usage_fix.py   2024-02-17 21:20:35.857031000 +0530
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3

 import shutil
+import sys

 def check_disk_usage(disk, min_absolute, min_percent):
     """Returns True if there is enough free disk space, false otherwise."""
@@ -16,7 +17,7 @@
 # Check for at least 2 GB and 10% free
 if not check_disk_usage("/", 2*2**30, 10):
     print("ERROR: Not enough disk space")
-    return 1
+    sys.exit(1)

 print("Everything ok")
-return 0
+sys.exit(0)
\ No newline at end of file
```
- writing diff file

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ diff -u disk_usage_ori.py disk_usage_fix.py > disk_usage.diff
```

- content of diff file

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat disk_usage.diff
```
*output*:
```console
--- disk_usage_ori.py   2024-02-17 21:08:27.157126400 +0530
+++ disk_usage_fix.py   2024-02-17 21:20:35.857031000 +0530
@@ -1,6 +1,7 @@
 #!/usr/bin/env python3

 import shutil
+import sys

 def check_disk_usage(disk, min_absolute, min_percent):
     """Returns True if there is enough free disk space, false otherwise."""
@@ -16,7 +17,7 @@
 # Check for at least 2 GB and 10% free
 if not check_disk_usage("/", 2*2**30, 10):
     print("ERROR: Not enough disk space")
-    return 1
+    sys.exit(1)

 print("Everything ok")
-return 0
+sys.exit(0)
\ No newline at end of file
```

- patching file disk_usage.py

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ patch  disk_usage.py < disk_usage.diff
```
*output*:
```
patching file disk_usage.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/gitlearning (master)
$ cat disk_usage.py
```
*output*:

```console
#!/usr/bin/env python3

import shutil
import sys

def check_disk_usage(disk, min_absolute, min_percent):
    """Returns True if there is enough free disk space, false otherwise."""
    du = shutil.disk_usage(disk)
    # Calculate the percentage of free space
    percent_free = 100 * du.free / du.total
    # Calculate how many free gigabytes
    gigabytes_free = du.free / 2**30
    if percent_free < min_percent or gigabytes_free < min_absolute:
        return False
    return True

# Check for at least 2 GB and 10% free
if not check_disk_usage("/", 2*2**30, 10):
    print("ERROR: Not enough disk space")
    sys.exit(1)

print("Everything ok")
sys.exit(0)
```

- Now `disk_usage.py`  working as expected


## version control system (VCS)

- A Version Control System keeps track of the changes that we make to our files. By using a VCS, we can know when the changes were made and who made them. 
- It also lets us easily revert a change if it turned out not to be a good idea. It makes collaboration easier by allowing us to merge changes from lots of different sources.
- Unlike a regular file server which only saves the most recent version of a file, a VCS keeps track of all the different versions that we create as we save our changes. 
- There are many different version control systems, each with their own implementation and with their own advantages and disadvantages. But, no matter how the VCS is implemented internally, they always access the history of our files.
- On top of this, we can make edits to multiple files and treat that collection of edits as a single change which is commonly known as a commit.


### Version Control and Automation

### What is Git?
- Git is a VCS created in 2005 by Linus Torvalds.
- The developer who started the Linux kernel.
- Git is a free open source system available for installation on Unix based platforms, Windows and macOS. 
- Linus originally created Git to help manage the task of developing the Linux kernel


Git can work as a standalone program as a server and as a client. This means that you can use Git on a single machine without even having a network connection. Or you can use it as a server on a machine where you want to host your repository. And then you can use Git as a client to access the repository from another machine or even the same one.

So you can use Git with or without a network connection. You can use it for small projects with like one developer or huge projects with thousands of contributors. You can use it to track private work that you can keep to yourself or you can share your work with others by hosting a code on public servers like Github, Gitlab or others.

There are other VCS programs like *Subversion* or *Mercurial*.

Sorces:

- https://git-scm.com/doc
- https://www.mercurial-scm.org/
- https://subversion.apache.org/
- https://en.wikipedia.org/wiki/Version_control

---

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ mkdir checks
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd checks
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks
$ git init
```
*output*:
```console
Initialized empty Git repository in C:/Users/pkyadav/OneDrive - xxxxxx/Desktop/git/checks/.git/
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ ls -la
```
*output*:
```console
total 8
drwxr-xr-x 1 pkyadav 1166583 0 Feb 17 23:43 ./
drwxr-xr-x 1 pkyadav 1166583 0 Feb 17 23:43 ../
drwxr-xr-x 1 pkyadav 1166583 0 Feb 17 23:43 .git/
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ ls -la
```
*output*:
```console
total 27
drwxr-xr-x 1 pkyadav 1166583   0 Feb 17 23:47 ./
drwxr-xr-x 1 pkyadav 1166583   0 Feb 17 23:43 ../
drwxr-xr-x 1 pkyadav 1166583   0 Feb 17 23:43 .git/
-rwxr-xr-x 1 pkyadav 1166583 272 Feb 17 19:58 cpu_usage.py*
-rwxr-xr-x 1 pkyadav 1166583 662 Feb 17 22:05 disk_usage.py*
-rwxr-xr-x 1 pkyadav 1166583 683 Feb 17 21:20 disk_usage_fix.py*
-rwxr-xr-x 1 pkyadav 1166583 667 Feb 17 21:08 disk_usage_ori.py*
-rwxr-xr-x 1 pkyadav 1166583 229 Feb 17 15:31 rearrange1.py*
-rwxr-xr-x 1 pkyadav 1166583 227 Feb 17 15:32 rearrange2.py*
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ ls -l
```
*output*:
```console
total 15
-rwxr-xr-x 1 pkyadav 1166583 272 Feb 17 19:58 cpu_usage.py*
-rwxr-xr-x 1 pkyadav 1166583 662 Feb 17 22:05 disk_usage.py*
-rwxr-xr-x 1 pkyadav 1166583 683 Feb 17 21:20 disk_usage_fix.py*
-rwxr-xr-x 1 pkyadav 1166583 667 Feb 17 21:08 disk_usage_ori.py*
-rwxr-xr-x 1 pkyadav 1166583 229 Feb 17 15:31 rearrange1.py*
-rwxr-xr-x 1 pkyadav 1166583 227 Feb 17 15:32 rearrange2.py*
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ ls -l .git/
```

```console
total 13
-rw-r--r-- 1 pkyadav 1166583  28 Feb 18 01:35 COMMIT_EDITMSG
-rw-r--r-- 1 pkyadav 1166583 130 Feb 18 01:09 config
-rw-r--r-- 1 pkyadav 1166583  73 Feb 18 01:09 description
-rw-r--r-- 1 pkyadav 1166583  23 Feb 18 01:09 HEAD
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 01:09 hooks/
-rw-r--r-- 1 pkyadav 1166583 145 Feb 18 01:35 index
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 01:09 info/
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 01:18 logs/
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 01:35 objects/
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 01:09 refs/
```

**Staging area (area):** A file maintain by Git that contains all of the information about what files and changes are going  to go into your next commit.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git add disk_usage.py
```

*output*:
```console
warning: LF will be replaced by CRLF in disk_usage.py.
The file will have its original line endings in your working directory
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```
*output*:
```console
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   disk_usage.py

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        cpu_usage.py
        disk_usage_fix.py
        disk_usage_ori.py
        rearrange1.py
        rearrange2.py

```



```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git commit -m "Add periods to the end of sentences."
```
*output*:
```console
[master (root-commit) ad401fc] Add periods to the end of sentences.
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 23 insertions(+)
 create mode 100644 disk_usage.py

```



```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```
*output*:
```console
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        cpu_usage.py
        disk_usage_fix.py
        disk_usage_ori.py
        rearrange1.py
        rearrange2.py

nothing added to commit but untracked files present (use "git add" to track)

```



```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git add --all
```
*output*:
```console
warning: LF will be replaced by CRLF in cpu_usage.py.
The file will have its original line endings in your working directory
```



```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```
*output*:
```console
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   cpu_usage.py
        new file:   disk_usage_fix.py
        new file:   disk_usage_ori.py
        new file:   rearrange1.py
        new file:   rearrange2.py

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git commit -m "commit rest of the files--init commit."
```
*output*:
```console
[master ab5ade5] commit rest of the files--init commit.
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 5 files changed, 85 insertions(+)
 create mode 100644 cpu_usage.py
 create mode 100644 disk_usage_fix.py
 create mode 100644 disk_usage_ori.py
 create mode 100644 rearrange1.py
 create mode 100644 rearrange2.py
```


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```
*output*:
```console
On branch master
nothing to commit, working tree clean
```






---

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ mkdir scripts
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd scripts
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts
$ git init
```
*output*:
```console
Initialized empty Git repository in C:/Users/pkyadav/OneDrive - xxxxxx/Desktop/git/scripts/.git/
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output*:
```console
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        all_checks.py

nothing added to commit but untracked files present (use "git add" to track)
```

`all_checks.py` file with empty function

```py
#!/usr/bin/env python3

def main():
    pass

main()

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git add all_checks.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output*:
```console
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   all_checks.py

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git commit
```
> one window will pop up
press `i` for insert mode and type message on top
Create an empty all_checks.
`esc` to exit insert mode, 
then type `:x!` (now the cursor is at the bottom) 
and hit `enter` to save and exit.

```console
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
#
# Initial commit
#
# Changes to be committed:
#       new file:   all_checks.py
#
```

`all_checks.py` file with `check_reboot()` function
```py
#!/usr/bin/env python3

import os

def check_reboot():
    """Returns True if the computer has a pending reboot."""
    return os.path.exists("/run/reboot-required")   

def main():
    pass

main()

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output*:
```console
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   all_checks.py

no changes added to commit (use "git add" and/or "git commit -a")
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git add all_checks.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git commit -m 'Add a check_reboot function'
```
*output*:
```console
[master f9b00fd] Add a check_reboot function
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 6 insertions(+)

```


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git log
```

```console
commit f9b00fd28562f3a34f2706ee356734d9feb18162 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:35:01 2024 +0530

    Add a check_reboot function

commit bbb38d986d2682ab7d62170ac088c31fa722afd3
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:14:37 2024 +0530

    Create an empty all checks.
```

**Provide a good commit message example**

The purpose of this commit is to provide an example of a hand-crafted,artisanal commit message. The first line is a short, approximately 50-charactersummary, followed by an empty line. The subsequent paragraphs are jam-packedwith descriptive information about the change, but each line is kept under 72 characters in length. If even more information is needed to explain the change, more paragraphs can be added after blank lines, with links to issues, tickets, or bugs. Remember that future you will thank current you for your thoughtfulness and foresight!

```
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
#
# Changes to be committed:
# new file:   super_script.py
# new file:   cool_co
```

```
Commit message style guide for Git

The first line of a commit message serves as a summary.  When displayed
on the web, it's often styled as a heading, and in emails, it's
typically used as the subject.  As such, you should capitalize it and
omit any trailing punctuation.  Aim for about 50 characters, give or
take, otherwise it may be painfully truncated in some contexts.  Write
it, along with the rest of your message, in the imperative tense: "Fix
bug" and not "Fixed bug" or "Fixes bug".  Consistent wording makes it
easier to mentally process a list of commits.

Oftentimes a subject by itself is sufficient.  When it's not, add a
blank line (this is important) followed by one or more paragraphs hard
wrapped to 72 characters.  Git is strongly opinionated that the author
is responsible for line breaks; if you omit them, command line tooling
will show it as one extremely long unwrapped line.  Fortunately, most
text editors are capable of automating this.

:q
```

## Study guide: Git

**`Git config` command:**
The Git config command is used to set the values to identify who made changes to Git repositories. To set the values of user.email and user.name to your email and name, type: 

```
: ~$ git config  --global user.email "me@example.com"
: ~$ git config  --global user.name "My name"
```

**Git init command:**
`: ~/checks$ git init`
The Git init command can create a new empty repository in a current directory or re-initialize an existing one. 

**it ls -la command:**
`: ~/checks$ ls -la`
The Git ls - la command checks that an identified directory exists.

`: ~/checks$ ls -l .git/`
The ls-l.git command checks inside the directory to see the different things that it contains. This is called the Git directory. The Git directory is a database for your Git project that stores the changes and the change history.

**Git add command:**
`:~/checks$ git add disk_usage.py`
Using the Git add command allows Git to track your file and uses the selected file as a parameter when adding it to the staging area. The staging area is a file maintained by Git that contains all the information about what files and changes are going to go into your next commit.

**Git status command:**
`:~/checks$ git status`
The Git status command is used to get some information about the current working tree and pending changes.

**Git commit command:**
`:~/checks$ git commit`

The `.git` commit command is run to remove changes made from the staging area to the `.git` directory. When this command is run, it tells Git to save changes. A text editor is opened that allows a commit message to be entered.

**Guidelines for writing commit messages:**
A commit message is generally broken into two sections: a short summary and a description of the changes. When the git commit command is run, Git will open a text editor to write your commit message. A good commit message includes the following:

*Summary:* The first line contains the summary, formatted as a header, containing 50 characters or less. 

*Description:* The description is usually kept under 72 characters and provides detailed information about the change. It can include references to bugs or issues that will be fixed with the change. It also can include links to more information when relevant. 

*Click the link to review an example of a commit message:* 
https://commit.style/

### Glossary terms

**Commit** A command to make edits to multiple files and treat that collection of edits as a single change

**Commit files:** A stage where the changes made to files are safely stored in a snapshot in the Git directory

Commit message: A summary and description with contextual information on the parts of the code or configuration of the commit change

**Diff:** A command to find the differences between two files

**DNS zone file:** A configuration file that specifies the mappings between IP addresses and host names in your network

**Git:** A free open source version control system available for installation on Unix based platforms, Windows and macOS

**Git directory:** A database for a Git project that stores the changes and the change history

**Git log:** A log that displays commit messages 

**Git staging area:** A file maintained by Git that contains all the information about what files and changes are going to go into the next commit

**Modified files:** A stage where changes have been made to a file, but the have not been stored or committed 

**Patch:** A command that can detect that there were changes made to the file and will do its best to apply the changes

**Repository:** An organization system of files that contain separate software projects 

**Source Control Management (SCM):** A tool similar to VCS to store source code

**Stage files:** A stage where the changes to files are ready to be committed 

**Tracked:** A file’s changes are recorded

**Untracked:** A file’s changes are not recorded

**Version control systems (VCS):** A tool to safely test code before releasing it, allow multiple people collaborate on the same coding projects together, and stores the history of that code and configuration
































 