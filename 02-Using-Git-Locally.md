
# Advance Git interaction

## Skipping the staging area

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd scripts
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ notepad all_checks.py
```

```py
#!/usr/bin/env python3

import os
import sys

def check_reboot():
    """Returns True if the computer has a pending reboot."""
    return os.path.exists("/run/reboot-required")

def main():
    if check_reboot():
        print("Pending Reboot.")
        sys.exit(1)

main()

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output:*
```console
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   all_checks.py

no changes added to commit (use "git add" and/or "git commit -a")
```
- committing without staging
- `git commit -a`: A shortcut to stage any changes to *tracked files* and commit them in one step. Useful for small changes

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git commit -a -m "call check_reboot from main, exit with 1 on error"
```
*output:*
```console
[master b33216e] call check_reboot from main, exit with 1 on error
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 5 insertions(+), 2 deletions(-)
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output:*
```console
On branch master
nothing to commit, working tree clean

```


## Getting more information from the user

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git log -p
```
*output:*
```console
commit b33216e16039c1a8835d4f8447fa173e24946fa6 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 11:50:07 2024 +0530

    call check_reboot from main, exit with 1 on error

diff --git a/all_checks.py b/all_checks.py
index 2d35eee..710266a 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -1,12 +1,15 @@
 #!/usr/bin/env python3

 import os
+import sys

 def check_reboot():
     """Returns True if the computer has a pending reboot."""
-    return os.path.exists("/run/reboot-required")
+    return os.path.exists("/run/reboot-required")

 def main():
-    pass
+    if check_reboot():
+        print("Pending Reboot.")
+        sys.exit(1)

 main()

commit f9b00fd28562f3a34f2706ee356734d9feb18162
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:35:01 2024 +0530

    Add a check_reboot function

diff --git a/all_checks.py b/all_checks.py
index c0d03b3..2d35eee 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -1,5 +1,11 @@
 #!/usr/bin/env python3

+import os
+
+def check_reboot():
+    """Returns True if the computer has a pending reboot."""
+    return os.path.exists("/run/reboot-required")
+
 def main():
     pass


commit bbb38d986d2682ab7d62170ac088c31fa722afd3
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:14:37 2024 +0530

    Create an empty all checks.

diff --git a/all_checks.py b/all_checks.py
new file mode 100644
index 0000000..c0d03b3
--- /dev/null
+++ b/all_checks.py
@@ -0,0 +1,6 @@
+#!/usr/bin/env python3
+
+def main():
+    pass
+
+main()
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git log
```
*output:*
```console
commit b33216e16039c1a8835d4f8447fa173e24946fa6 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 11:50:07 2024 +0530

    call check_reboot from main, exit with 1 on error

commit f9b00fd28562f3a34f2706ee356734d9feb18162
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:35:01 2024 +0530

    Add a check_reboot function

commit bbb38d986d2682ab7d62170ac088c31fa722afd3
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:14:37 2024 +0530

    Create an empty all checks.
```

- Git uses the *HEAD* alias to represent the currently checked out snapshot of your project.


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git log --stat
```
*output:*
```console
commit b33216e16039c1a8835d4f8447fa173e24946fa6 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 11:50:07 2024 +0530

    call check_reboot from main, exit with 1 on error

 all_checks.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

commit f9b00fd28562f3a34f2706ee356734d9feb18162
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:35:01 2024 +0530

    Add a check_reboot function

 all_checks.py | 6 ++++++
 1 file changed, 6 insertions(+)

commit bbb38d986d2682ab7d62170ac088c31fa722afd3
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 01:14:37 2024 +0530

    Create an empty all checks.

 all_checks.py | 6 ++++++
 1 file changed, 6 insertions(+)
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git show b33216e16039c1a8835d4f8447fa173e24946fa6
```
*Output:*
```console
commit b33216e16039c1a8835d4f8447fa173e24946fa6
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 11:50:07 2024 +0530

    call check_reboot from main, exit with 1 on error

diff --git a/all_checks.py b/all_checks.py
index 2d35eee..710266a 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -1,12 +1,15 @@
 #!/usr/bin/env python3

 import os
+import sys

 def check_reboot():
     """Returns True if the computer has a pending reboot."""
-    return os.path.exists("/run/reboot-required")
+    return os.path.exists("/run/reboot-required")

 def main():
-    pass
+    if check_reboot():
+        print("Pending Reboot.")
+        sys.exit(1)

 main()

```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ notepad all_checks.py
```

```py
#!/usr/bin/env python3
  
import os
import sys

def check_reboot():
    """Returns True if the computer has a pending reboot."""
    return os.path.exists("/run/reboot-required")

def main():
    if check_reboot():
        print("Pending Reboot.")
        sys.exit(1)

    print("Everything ok.")
    sys.exit(0)

main()
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output:*
```console
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   all_checks.py

no changes added to commit (use "git add" and/or "git commit -a")

xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git diff
```
*output:*
```console
diff --git a/all_checks.py b/all_checks.py
index 710266a..2fb0f68 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-
+
 import os
 import sys

@@ -12,4 +12,7 @@ def main():
         print("Pending Reboot.")
         sys.exit(1)

+    print("Everything ok.")
+    sys.exit(0)
+
 main()
```
- `-p` flag show change being added and ask if we want to stage it or not

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git add -p
```
*output:*
```console
diff --git a/all_checks.py b/all_checks.py
index 710266a..2fb0f68 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-
+
 import os
 import sys

Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? y
@@ -12,4 +12,7 @@ def main():
         print("Pending Reboot.")
         sys.exit(1)

+    print("Everything ok.")
+    sys.exit(0)
+
 main()
Stage this hunk [y,n,q,a,d,K,g,/,e,?]?
y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk or any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
K - leave this hunk undecided, see previous hunk
e - manually edit the current hunk
? - print help
@@ -12,4 +12,7 @@ def main():
         print("Pending Reboot.")
         sys.exit(1)

+    print("Everything ok.")
+    sys.exit(0)
+
 main()
Stage this hunk [y,n,q,a,d,K,g,/,e,?]? y
<stdin>:8: trailing whitespace.

warning: 1 line adds whitespace errors.
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git diff
```
- Now `git diff` will not show anything as git diff knly shows unstaged changes. 
- we can all `gir diff --staged` to see changed staged but not committed

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git diff --staged
```
*output:*
```console
diff --git a/all_checks.py b/all_checks.py
index 710266a..2fb0f68 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-
+
 import os
 import sys

@@ -12,4 +12,7 @@ def main():
         print("Pending Reboot.")
         sys.exit(1)

+    print("Everything ok.")
+    sys.exit(0)
+
 main()

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git commit -m 'Add a message when everything is ok'
```
*output:*
```console
[master 49262cb] Add a message when everything is ok
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 4 insertions(+), 1 deletion(-)
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output:*
```console
On branch master
nothing to commit, working tree clean

```


## Deleting and Renaming Files

-  we can remove (and move) files from repository from `git rm` command

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd checks/
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ ls -l
```
*output:*
```console
total 16
-rwxr-xr-x 1 pkyadav 1166583 272 Feb 17 19:58 cpu_usage.py*
-rwxr-xr-x 1 pkyadav 1166583 662 Feb 17 22:05 disk_usage.py*
-rwxr-xr-x 1 pkyadav 1166583 683 Feb 17 21:20 disk_usage_fix.py*
-rwxr-xr-x 1 pkyadav 1166583 667 Feb 17 21:08 disk_usage_ori.py*
-rw-r--r-- 1 pkyadav 1166583  21 Feb 18 17:48 process.py
-rwxr-xr-x 1 pkyadav 1166583 229 Feb 17 15:31 rearrange1.py*
-rwxr-xr-x 1 pkyadav 1166583 227 Feb 17 15:32 rearrange2.py*
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```
*output:*
```console
On branch master
nothing to commit, working tree clean
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git rm process.py
```
*output:*
```console
rm 'process.py'
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```
*output:*
```console
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        deleted:    process.py

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git commit -m "Deleted the unneeded file"
```
*output:*
```console
[master 94c2991] Deleted the unneeded file
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 2 deletions(-)
 delete mode 100644 process.py

```

- 'git mv' to rename the file in repository

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git mv disk_usage.py check_free_space.py
```


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```
*output:*
```console
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        renamed:    disk_usage.py -> check_free_space.py

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git commit -m "new name for disk_usage.py"
```
*output:*
```console
[master cda0002] new name for disk_usage.py
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 0 insertions(+), 0 deletions(-)
 rename disk_usage.py => check_free_space.py (100%)
```

- `.gitignore`: Git will not track files and folders specified in .gitignore. However, the .gitignore file itself IS tracked by Git.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ echo .DS_STORE >.gitignore
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ ls -la
total 28
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 18:05 ./
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 02:23 ../
drwxr-xr-x 1 pkyadav 1166583   0 Feb 18 18:01 .git/
-rw-r--r-- 1 pkyadav 1166583  10 Feb 18 18:05 .gitignore
-rwxr-xr-x 1 pkyadav 1166583 662 Feb 17 22:05 check_free_space.py*
-rwxr-xr-x 1 pkyadav 1166583 272 Feb 17 19:58 cpu_usage.py*
-rwxr-xr-x 1 pkyadav 1166583 683 Feb 17 21:20 disk_usage_fix.py*
-rwxr-xr-x 1 pkyadav 1166583 667 Feb 17 21:08 disk_usage_ori.py*
-rwxr-xr-x 1 pkyadav 1166583 229 Feb 17 15:31 rearrange1.py*
-rwxr-xr-x 1 pkyadav 1166583 227 Feb 17 15:32 rearrange2.py*
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git add .gitignore
```
```console
warning: LF will be replaced by CRLF in .gitignore.
The file will have its original line endings in your working directory
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git commit -m "add a gitignore file ignoring .DS_STORE files"
```
*output:*
```console
[master b1ebd4e] add a gitignore file ignoring .DS_STORE files
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 1 insertion(+)
 create mode 100644 .gitignore
```






## Advanced Git: Summary


| Command           | Explanation & Link                                                                                                                                                                                    |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| git commit -a     | $ git commit -a  automatically stages the files that have been locally modified. New files which have not been published yet are not affected.                                                        |
| git log -p        | $ git log -p  produces patch text. A patch file is used to share your local changes with others without pushing your changes to the main branch of the repo.                                          |
| git show          | $ git show  shows you one or more object(s) such as blobs, trees, tags, and commits.                                                                                                                  |
| git diff          | $ git diff  is similar to the Linux `diff` command, and can show the changes between commits, changes between the working tree and index, changes between two trees, changes from a merge, and so on. |
| git diff --staged | $ git diff --staged  is an alias of $ git diff --cached, which  shows all staged files compared to the named commit.                                                                                  |
| git add -p        | $ git add -p  allows a user to interactively review patches before adding to the current commit.                                                                                                      |
| git mv            | $ git mv  is similar to the Linux `mv` command. This command can move or rename a file, directory, or symlink.                                                                                        |
| git rm            | $ git rm  is similar to the Linux `rm` command. This command deletes or removes a file from the working tree.                                                                                         |


[git-cheat-sheet](https://education.github.com/git-cheat-sheet-education.pdf)

**.gitignore files:**

.gitignore files are used to tell the git tool to intentionally ignore some files in a given Git repository. For example, this can be useful for configuration files or metadata files that a user may not want to check into the master branch. 

When writing a .gitignore file, there are some specific formats which help tell Git how to read the text in the file. For example, a line starting with # is a comment; a slash / is a directory separator. Visit https://git-scm.com/docs/gitignore to see more examples.

This GitHub repository offers some examples of configurations which are often included in a .gitignore file. These examples include: compiled sources, packages, logs, databases, and OS generated files.


# Undoing Things

## Undoing Changes Before Committing

### Before staging `git checkout`

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd scripts
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ notepad all_checks.py
```

```py
#!/usr/bin/env python3
  
import os
import sys

def main():
    if check_reboot():
        print("Pending Reboot.")
        sys.exit(1)

    print("Everything ok.")
    sys.exit(0)

main()

```
*output of above code: thowing error*
```console
Traceback (most recent call last):
  File "C:\Users\pkyadav\OneDrive - xxxxxx\Desktop\git\scripts\all_checks.py", line 14, in <module>
    main()
  File "C:\Users\pkyadav\OneDrive - xxxxxx\Desktop\git\scripts\all_checks.py", line 7, in main
    if check_reboot():
NameError: name 'check_reboot' is not defined
>>> 
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```

```console
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   all_checks.py

no changes added to commit (use "git add" and/or "git commit -a")
```

- `git checkout` : It reverts changes to modified files before they are staged.

- git checkout restores files to the latest stored snapshot, reverting any changes before staging.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git checkout all_checks.py
```

```console
Updated 1 path from the index
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```

```console
On branch master
nothing to commit, working tree clean
```

```py
#!/usr/bin/env python3

import os
import sys

def check_reboot():
    """Returns True if the computer has a pending reboot."""
    return os.path.exists("/run/reboot-required")

def main():
    if check_reboot():
        print("Pending Reboot.")
        sys.exit(1)

    print("Everything ok.")
    sys.exit(0)

main()

```
*output of above script*

```
Everything ok.
>>> 
```

### after staging `git reset`

- Storing output in a text file 'output.txt'

```console
C:\Users\pkyadav\OneDrive - xxxxxx\Desktop\git\scripts>all_checks.py > output.txt
```
```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ cat output.txt
```
*output:*
```console
Everything ok.
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output:*
```console
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        output.txt

nothing added to commit but untracked files present (use "git add" to track)
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git add *
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output:*
```console
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   output.txt

```
- `git reset HEAD` Now if we want to unstage file 

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git reset HEAD output.txt
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```

```console
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        output.txt

nothing added to commit but untracked files present (use "git add" to track)
```
- once again file in working tree Untracked
- `reset` is coubter of `add`

## Amending commits `git commit --amend`

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```

```console
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        auto-update.py
        gather-information.sh
        output.txt

nothing added to commit but untracked files present (use "git add" to track)
```

- The `touch` command in Linux is used to create a new empty file and to change the timestamps of existing files.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ touch auto-update.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ touch gather-information.sh
```

- We added two new file `auto-update.py`,  `gather-information.sh`

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ ls -l
```

```console
total 7
-rwxr-xr-x 1 pkyadav 1166583  339 Feb 18 18:46 all_checks.py*
-rw-r--r-- 1 pkyadav 1166583   21 Feb 18 21:30 auto-update.py
-rwxr-xr-x 1 pkyadav 1166583 1070 Feb 18 21:31 gather-information.sh*
-rw-r--r-- 1 pkyadav 1166583   16 Feb 18 19:12 output.txt
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git add auto-update.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git commit -m 'Add two new scripts'
```

```console
[master d188457] Add two new scripts
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 2 insertions(+)
 create mode 100644 auto-update.py
```
- here we added one file but wrote two files, lets ammend this

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git add gather-information.sh
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git commit --amend
```

- we will see something like this

```
Add two new scripts.

# Please enter the commit message for your changes. Line starting
#with '#' will be ignored, and an empty message aborts the commit.
#
#Date: Mon Jan 6 08:28:17 2020 -0800
#
# On branch master
# Changes to be committed:
#	new file: auto-update.py
#	new file: gather-information.sh
#
# Untracked files:
#	output.txt
```

- Now we will change to this

```
Add two new scripts.

gather-information.sh will collect information in case of errors.
auto-update.py will run daily to update computers automatically.

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Sun Feb 18 21:32:34 2024 +0530
# Committer: Kumar Yadav <pkyadav01234@gmail.com>
#
# On branch master
# Changes to be committed:
#       new file:   auto-update.py
#       new file:   gather-information.sh
#
# Untracked files:
#       output.txt

```

*output:*

```console
[master 04ee07c] Add two new scripts.
 Date: Sun Feb 18 21:32:34 2024 +0530
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 2 files changed, 38 insertions(+)
 create mode 100644 auto-update.py
 create mode 100644 gather-information.sh
```
-  **git `commit --amend` allows us to modify and add changes to the most recent commit.** 
- Avoid amending commits that have already been made public.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git status
```
*output:*
```console
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        output.txt

nothing added to commit but untracked files present (use "git add" to track)

xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$

```

## Rollbacks `git revert`

Let's say you host to Git repository on a company server that contains all kinds of useful automation scripts that you and your coworkers use. One morning before coffee, you make a few changes to one of these scripts and commit the updated files. A few hours later, you start to receive tickets from users indicating some part of the script is broken. From the errors they describe, it sounds like the problem is related to your recent changes.

Oh, you could look at the code you updated to see if you can spot the bug. But more tickets are pouring in and you want to fix the problem as fast as possible. You decided it's time for a rollback.

There are a few ways to rollback commits in Git. For now, we'll focus on using the git revert command. Git revert doesn't just mean undo. Instead, it creates a commit that contains the inverse of all the changes made in the bad commit in order to cancel them out. For example, if a particular line was added in the bad commit, then in the reverted commit, the same line will be deleted.

- lets add a faulty commit to our example


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ notepad all_checks.py
```

- change the `all_checks.py` to this

```py
#!/usr/bin/env python3
  
import os
import sys

def check_reboot():
    """Returns True if the computer has a pending reboot."""
    return os.path.exists("/run/reboot-required")

def main():
    if check_reboot():
        print("Pending Reboot.")
        sys.exit(1)

    if disk_full():
        print("Disk Full.")
        sys.exit(1)

    print("Everything ok.")
    sys.exit(0)

main()

```
- lets commit it now

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git commit -a -m 'Add call to disk_full function'
```
*output:*

```console
[master 2fe2668] Add call to disk_full function
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 4 insertions(+)

```

- but recent change is giving error



```
NameError: name 'disk_full' is not defined
```

- lets revert it

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git revert HEAD
```

```
Revert "Add call to disk_full function"

Reason for rollback: the disk_full function is undefined

This reverts commit 2fe2668c62067ce41194df556d5d38d8e9533777.

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Sun Feb 18 22:15:01 2024 +0530
# Committer: Kumar Yadav <pkyadav01234@gmail.com>
#
# On branch master
# Changes to be committed:
#       modified:   all_checks.py
#
# Untracked files:
#       output.txt
#
```

*output*:

```console
[master 743247f] Revert "Add call to disk_full function"
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 4 deletions(-)
```
- git revert creates a commit for us. Since a revert is a normal commit, we can see both the commit and the reverted commit in the log. 
- lets look last two entry of log


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/scripts (master)
$ git log -p -2
```

*output:*
```console
commit 03096f128f1ab22925539289d1602f7f94c69c27 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 22:15:01 2024 +0530

    Revert "Add call to disk_full function"

    Reason for rollback: the disk_full function is undefined

    This reverts commit 2fe2668c62067ce41194df556d5d38d8e9533777.

diff --git a/all_checks.py b/all_checks.py
index 536b468..2fb0f68 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -12,10 +12,6 @@ def main():
         print("Pending Reboot.")
         sys.exit(1)

-    if disk_full():
-        print("Disk Full.")
-        sys.exit(1)
-
     print("Everything ok.")
     sys.exit(0)


commit 2fe2668c62067ce41194df556d5d38d8e9533777
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 22:12:00 2024 +0530

    Add call to disk_full function

diff --git a/all_checks.py b/all_checks.py
index 2fb0f68..536b468 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -12,6 +12,10 @@ def main():
         print("Pending Reboot.")
         sys.exit(1)

+    if disk_full():
+        print("Disk Full.")
+        sys.exit(1)
+
     print("Everything ok.")
     sys.exit(0)

```

- Hence, With `git revert`, a new commit is created with inverse changes. This cancels previous changes instead of making it as though the original commit never happened.

## Identifying a commit

- Commit IDs are those complicated looking strings that appear after the word commit in the log messages. Let's have a look at the latest log entry in our checks repo.
- The commit ID is the 40 character long string after the word commit, you really can't miss it. This long jumble of letters and numbers is actually something called a `hash`, which is calculated using an algorithm called SHA1. Essentially, what this algorithm does is take a bunch of data as input and produce a 40 character string from the data as the output.

- How can you use commit IDs to specify a particular commit to work with, like during a rollback? Let's look at the last two entries in our repo using the git log -2 command.


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd checks
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git log -2
```

```console
commit b1ebd4e322c1d7bfb37cbccac401553559705c34 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 18:09:31 2024 +0530

    add a gitignore file ignoring .DS_STORE files

commit cda000282c02fc83a9b55778fb3f193b35b2af94
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 18:01:13 2024 +0530

    new name for disk_usage.py

xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$
```

- we can see particular commit with Commit ID

```console
$ git show cda000282c02fc83a9b55778fb3f193b35b2af94
```

```console
commit cda000282c02fc83a9b55778fb3f193b35b2af94
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 18:01:13 2024 +0530

    new name for disk_usage.py

diff --git a/disk_usage.py b/check_free_space.py
similarity index 100%
rename from disk_usage.py
rename to check_free_space.py
```
- we can type only few initial letters for the same

```console
$ git show cda0002
```

```console
commit cda000282c02fc83a9b55778fb3f193b35b2af94
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 18:01:13 2024 +0530

    new name for disk_usage.py

diff --git a/disk_usage.py b/check_free_space.py
similarity index 100%
rename from disk_usage.py
rename to check_free_space.py
```
- lets revert to this commit

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git revert cda0002
```
- it will pop up commint window

*output*
```console
[master bb57d71] Revert "new name for disk_usage.py"
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 0 insertions(+), 0 deletions(-)
 rename check_free_space.py => disk_usage.py (100%)
```
- it will create new commit id, lets see this with id

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git show bb57d71
```

```console
commit bb57d715c5ccb905a16cfdecc56394c6f23e9b64 (HEAD -> master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 22:44:41 2024 +0530

    Revert "new name for disk_usage.py"

    Rollback reason: the previous name was actually better :)

    This reverts commit cda000282c02fc83a9b55778fb3f193b35b2af94.

diff --git a/check_free_space.py b/disk_usage.py
similarity index 100%
rename from check_free_space.py
rename to disk_usage.py

xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$

```
- we've managed to revert a commit that wasn't the most recent one. Well done, time travelers. 


## Git Revert: Summary


When writing and committing code, making mistakes is a common occurrence. Thankfully, there are multiple ways for you to revert or undo your mistakes. Take a look at the helpful commands below.

*[git checkout](https://git-scm.com/docs/git-checkout)*
 is used to switch branches. For example, you might want to pull from your main branch. In this case, you would use the command `git checkout main`. This will switch to your main branch, allowing you to pull. Then you could switch to another branch by using the command  `git checkout <branch>`.

*[git reset](https://git-scm.com/docs/git-reset#_examples)*
  can be somewhat difficult to understand. Say you have just used the command git add. to stage all of your changes, but then you decide that you are not ready to stage those files. You could use the command git reset to undo the staging of your files.

There are some other useful articles online, which discuss more aggressive approaches to [resetting the repo](https://jwiegley.github.io/git-from-the-bottom-up/3-Reset/4-doing-a-hard-reset.html)
 (Git repository). As discussed in this article, doing a hard reset can be extremely dangerous. With a hard reset, you run the risk of losing your local changes. There are safer ways to achieve the same effect. For example, you could run git stash, which will temporarily shelve or stash your current changes. This way, your current changes are kept safe, and you can come back to them if needed.

*[git commit --amend](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---amend)*
 is used to make changes to your most recent commit after-the-fact, which can be useful for making notes about or adding files to your most recent commit. Be aware that this git --amend command rewrites and replaces your previous commit, so it is best not to use this command on a published commit.

*[git revert](https://git-scm.com/docs/git-revert)*
 makes a new commit which effectively rolls back a previous commit. Unlike the git reset command which rewrites your commit history, the git revert command creates a new commit which undoes the changes in a specific commit. Therefore, a revert command is generally safer than a reset command.

For more information on these and other methods to undo something in Git, checkout this [Git Basics - Undoing Things](https://git-scm.com/book/en/v2/Git-Basics-Undoing-Things) article.

Additionally, there are some interesting considerations about how git object data is stored, such as the usage of SHA-1.

SHA-1 is what’s known as a hash function, a cryptographic function that generates a digital fingerprint of a file. Theoretically, it’s impossible for two different files to have the same SHA-1 hash, which means that SHA-1 can be used for two things:

- Confirming that the contents of a file have not changed (digital signature).
- Serving as an identifier for the file itself (a token or fingerprint).

Git calculates a hash for every commit. Those hashes are displayed by commands like git log or in various pages on Github. For commands like git revert, you can then use the hash to refer to a specific commit.

Feel free to read more here:

- [SHA-1 collision detection on GitHub.com](https://github.blog/2017-03-20-sha-1-collision-detection-on-github-com/)

Even the most accomplished developers make mistakes in Git. It happens to everyone, so don’t stress about it. You have these and other methods to help you revert or undo your mistakes.





# Branching and merging

**Branch**: 
- A pointer to a particular commit
- The default branch that git creates for you when a new repository is initialized is *called master*
- By creating a new branch, we can experiment without breaking what already works.

## Creating new branches

- We can use the git branch command to list, ctraete, delete, and manipulate branches.
- `git branch`: list all the branches
- `git branch name`: to create new branch name *name*
- `git checkout name`: switch to new branch *name*
- `git checkout -b name`: create and switch to new branch

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git
$ cd checks/
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch
```

```console
* master
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch new-feature
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch
```

```console
* master
  new-feature
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git checkout new-feature
```

```console
Switched to branch 'new-feature'
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (new-feature)
$ git checkout -b even-better-feature
```

```console
Switched to a new branch 'even-better-feature'
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ notepad free_memory.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git status
```

```console
On branch even-better-feature
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        free_memory.py

nothing added to commit but untracked files present (use "git add" to track)

```

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git add free_memory.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git branch
```

```console
* even-better-feature
  master
  new-feature
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git commit -m "new branch commit"
```

```console
[even-better-feature 4328a53] new branch commit
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 3 insertions(+)
 create mode 100644 free_memory.py


```
## Working with branches

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git checkout master
```

```console
Switched to branch 'master'
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git log -2
```

```console
commit bb57d715c5ccb905a16cfdecc56394c6f23e9b64 (HEAD -> master, new-feature, even-better-feature)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 22:44:41 2024 +0530

    Revert "new name for disk_usage.py"

    Rollback reason: the previous name was actually better :)

    This reverts commit cda000282c02fc83a9b55778fb3f193b35b2af94.

commit b1ebd4e322c1d7bfb37cbccac401553559705c34
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 18:09:31 2024 +0530

    add a gitignore file ignoring .DS_STORE files
```
- Notice how next to the latest commit ID, git shows that this is where head is pointing to and that the branch is called even better feature.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git checkout even-better-feature
```

```console
Switched to branch 'even-better-feature'

xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git log -2
commit 4328a53d9cc67a148f21da13db21149413d3beff (HEAD -> even-better-feature)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Mon Feb 19 00:10:03 2024 +0530

    new branch commit

commit bb57d715c5ccb905a16cfdecc56394c6f23e9b64 (master)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 22:44:41 2024 +0530

    Revert "new name for disk_usage.py"

    Rollback reason: the previous name was actually better :)

    This reverts commit cda000282c02fc83a9b55778fb3f193b35b2af94.

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git checkout master
```

```console
Switched to branch 'master'
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch
```

```console
  even-better-feature
* master
  new-feature
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch -d new-feature
```

```console
Deleted branch new-feature (was bb57d71).

xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch
  even-better-feature
* master
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch -d even-better-feature
```

```console
error: The branch 'even-better-feature' is not fully merged.
If you are sure you want to delete it, run 'git branch -D even-better-feature'.
```


## Merging

- The term thet Git uses for combining branched data and history together.

- We'll use the `git merge` command, which lets us take the independent snapshots and history of one Git branch, and tangle them into another.
- First, will check that we're in master branch, and then we'll call git merge even-better-feature to merge the even-better-feature branch into the master branch.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch
```

```console
  even-better-feature
* master
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git merge even-better-feature
```

```console
Updating bb57d71..4328a53
Fast-forward
 free_memory.py | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 free_memory.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git log -2
```

```console
commit 4328a53d9cc67a148f21da13db21149413d3beff (HEAD -> master, even-better-feature)
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Mon Feb 19 00:10:03 2024 +0530

    new branch commit

commit bb57d715c5ccb905a16cfdecc56394c6f23e9b64
Author: Kumar Yadav <pkyadav01234@gmail.com>
Date:   Sun Feb 18 22:44:41 2024 +0530

    Revert "new name for disk_usage.py"

    Rollback reason: the previous name was actually better :)

    This reverts commit cda000282c02fc83a9b55778fb3f193b35b2af94.
```
- As we're on the master branch, HEAD points at master. We can see the even-better-feature and master branches are now both pointing at the same commit.

- Git uses two different algorithms to perform a merge, fast-forward and three-way merge. The merge we just performed is an example of a fast-forward merge.

- This kind of merge occurs when all the commits in the checked out branch are also in the branch that's being merged. If this is the case, we can say that the commit history of both branches doesn't diverge. In these cases, all Git has to do is update the pointers of the branches to the same commit, and no actual merging needs to take place. 

---
- On the other hand, a three-way merge is performed when the history of the merging branches has diverged in some way, and there isn't a nice linear path to combine them via fast-forwarding. This happens when a commit is made on one branch after the point when both branches split.

## Merge conflicts

- Here git need a little bit help in merg

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git branch
  even-better-feature
* master
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ notepad free_memory.py
```

```py
#!/usr/bin/env python3
  
def main():
    """Checks if there's enough free memory in the computer."""

main()
```


```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git commit -a -m 'Add comment to main()'
```

```console
[master 723c8be] Add comment to main()
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 5 insertions(+), 1 deletion(-)

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git checkout even-better-feature
```
```console
Switched to branch 'even-better-feature'
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ notepad free_memory.py
```

```py 
#!/usr/bin/env python3
  
def main():
    print("Everything ok.")

main()
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git commit -a -m 'Print everything ok'
```

```console
[even-better-feature 8c836fc] Print everything ok
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 5 insertions(+), 1 deletion(-)

```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (even-better-feature)
$ git checkout master
```

```console
Switched to branch 'master'

xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git merge even-better-feature
Auto-merging free_memory.py
CONFLICT (content): Merge conflict in free_memory.py
Automatic merge failed; fix conflicts and then commit the result.
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git merge even-better-feature
```

```console
Auto-merging free_memory.py
CONFLICT (content): Merge conflict in free_memory.py
Automatic merge failed; fix conflicts and then commit the result.
```

-  Git tells us it tried to automatically merge the two versions of the free memory file, but it didn't know how to do it. We can use Git's status to get more information about what's going on.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master|MERGING)
$ git status
```

```console
On branch master
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)

        both modified:   free_memory.py

no changes added to commit (use "git add" and/or "git commit -a")
```

- It tells us that we have files that are currently unmerged, and that we need to fix the conflicts or abort the merge if we decide it was a mistake. It also tells us that we need to run Git add on each unmerged file to mark that the conflicts have been resolved. 

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master|MERGING)
$ notepad free_memory.py
```

```py
<<<<<<< HEAD
atom free_memory.py
#!/usr/bin/env python3
  
def main():
    """Checks if there's enough free memory in the computer."""
=======
atom free_memory.py 
#!/usr/bin/env python3
  
def main():
    print("Everything ok.")
>>>>>>> even-better-feature

main()
```

- To fix the conflict, let's open up free_memory.py in our text editor. Thankfully, Git has added some information to our files to tell us which parts of the code are conflicting. The unmerged content of the file at head, remember, in this case, head points to master, is the docstring stating what the main function should do. The unmerged content of the file in the even-better-feature branch is the call to the print function. It's up to us to decide which one to keep or if we should change the contents of the file altogether.

```console
atom free_memory.py 
#!/usr/bin/env python3
  
def main():
    print("Everything ok.")

main()
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master|MERGING)
$ git add free_memory.py
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master|MERGING)
$ git status
```

```console
On branch master
All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)
Changes to be committed:
        modified:   free_memory.py
```

-  Git now tells us that all conflicts have been resolved.

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master|MERGING)
$ git commit
```

```
Merge branch 'even-better-feature'

Kept lines from both branches

# Conflicts:
#       free_memory.py
#
# It looks like you may be committing a merge.
# If this is not correct, please remove the file
#       .git/MERGE_HEAD
# and try again.
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
# All conflicts fixed but you are still merging.
#
# Changes to be committed:
#       modified:   free_memory.py
```


```console
[master 3fd4786] Merge branch 'even-better-feature'
 Committer: Kumar Yadav <pkyadav01234@gmail.com>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author
```

```console
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git status
```

```console
On branch master
nothing to commit, working tree clean
```

```
xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git log --graph --online
```

```
fatal: unrecognized argument: --online

xxxxxxxxxxxxxxxxxxxx/Desktop/git/checks (master)
$ git log --graph --oneline
*   7339ee9 (HEAD -> master) Merge branch 'even-better-feature'
|\
| * 8c836fc (even-better-feature) Print everything ok
* | 723c8be Add comment to main()
|/
* 4328a53 new branch commit
* bb57d71 Revert "new name for disk_usage.py"
* b1ebd4e add a gitignore file ignoring .DS_STORE files
* cda0002 new name for disk_usage.py
* 94c2991 Deleted the unneeded file
* b70684c New file committed
* ab5ade5 commit rest of the files--init commit.
* ad401fc Add periods to the end of sentences.
```

- This format helps us better understand the history of our commits and how merges have occurred. We can see the new commit that was added and also the two separate commits that we merged. One coming from the master branch and the other coming from the even-better-feature branch.

- Merge conflicts can sometimes be tricky, complicated, and spread across multiple files. If you want to throw the merge away and start over, you can use the `git merge --abort` command as an escape hatch.

## Git branches and merging: summary

[source](https://git-scm.com/docs/git-checkout#Documentation/git-checkout.txt--bltnewbranchgt)

| Command                      | Explanation & link                                                                                                                         |
|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| git branch                   |  $ git branch  can be used to list, create, or delete branches.                                                                            |
| git branch <name>            | $ git branch <name>  can be used to create a new branch in your repository.                                                                |
| git branch -d <name>         | $ git branch -d <name>  can be used to delete a branch from your repository.                                                               |
| git branch -D <name>         | $ git branch -D <branch>  forces a branch to be deleted.                                                                                   |
| git checkout <branch>        | $ git checkout <branch>  switches your current working branch.                                                                             |
| git checkout -b <new-branch> | $ git checkout -b <new-branch>  creates a new branch and makes it your current working branch.                                             |
| git merge <branch>           | $ git merge <branch>  joins changes from one branch into another branch.                                                                   |
| git merge --abort            |  $ git merge --abort  can only be used after merge conflicts. This command will abort the merge and try to go back to the pre-merge state. |
| git log --graph              | $ git log --graph  prints an ASCII graph of the commit and merge history.                                                                  |
| git log --oneline            | $ git log --oneline  prints each commit on a single line.                                                                                  |

---

Terms and definitions from Course 3, Module 2
*Branch*: A pointer to a particular commit, representing an independent line of development in a project

*Commit ID*: An identifier next to the word commit in the log

*Fast-forward merge*: A merge when all the commits in the checked out branch are also in the branch that's being merged

*Head*: This points to the top of the branch that is being used

*Master*: The default branch that Git creates for when a new repository initialized, commonly used to place the approved pieces of a project

*Merge conflict*: This occurs when the changes are made on the same part of the same file, and Git won't know how to merge those changes

*Rollback*: The act of reverting changes made to software to a previous state 

*Three-way merge*: A merge when the snapshots at the two branch tips with the most recent common ancestor, the commit before the divergence








