

# Introduction to Github

we called out that Git is a distributed version control system. 

**Distributed** means that each developer has a copy of the whole repository on their local machine.

Any of us can create a Git server like this one, and many companies have similar internal services. But if you don't want to set up a Git server yourself and host your repositories, you can use an online service like GitHub.

GitHub is a web-based Git repository hosting service. On top of the version control functionality of Git, GitHub includes extra features like bug tracking, wikis, and task management. GitHub lets us share and access repositories on the web and copy or clone them to our local computer, so we can work on them.

GitHub provides free access to a Git server for public and private repositories.

GitHub is a popular choice with a robust feature set, but it's not the only one. Other services that provide similar functionality are *BitBucket*, and *GitLab*.

-For real configuration and development work, you should use a secure and private Git server, and limit the people authorized to work on it.

## Basic interaction with GitHub

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb
$ git clone https://github.com/iampramodyadav/Mynotes.git
```
- authentiation then copy

```console
Cloning into 'Mynotes'...
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (6/6), 73.86 KiB | 995.00 KiB/s, done.
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb
$ cd mynotes
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$ ls -l
```

```console
total 453
-rw-r--r-- 1 Asus 197121 462021 Feb 25 12:36 'My Python Notebook (Pramod)-I.ipynb'
-rw-r--r-- 1 Asus 197121      9 Feb 25 12:36  README.md
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$ notepad README.md
```
- modified README.md file

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$  git config --global user.email "pkyadavc01234@gmail.com"
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$ git config --global user.name "iampramodyadav"
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$ git commit -a -m "Add one more line to readme."
```

```console
[main e090936] Add one more line to readme.
 1 file changed, 5 insertions(+), 1 deletion(-)
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$ git log -p
```

```console
commit e09093693c90e840b50398a53f3f9983c30283d5 (HEAD -> main)
Author: iampramodyadav <pkyadavc01234@gmail.com>
Date:   Sun Feb 25 12:42:58 2024 +0530

    Add one more line to readme.

diff --git a/README.md b/README.md
index d1d7243..d6d5418 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,5 @@
-# Mynotes
\ No newline at end of file
+# Mynotes
+# health-checks
+Scripts that check the health of my computers
+
+This repo will be populated with lots of fancy checks.
\ No newline at end of file

commit b31ca6e85c1226ef4174b8bff8edd8c58c8d72e3 (origin/main, origin/HEAD)
Author: iampramodyadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Wed Feb 24 14:24:14 2021 +0530

    Add files via upload

diff --git a/My Python Notebook (Pramod)-I.ipynb b/My Python Notebook (Pramod)-I.ipynb
new file mode 100644
index 0000000..3b7fb0c
--- /dev/null
+++ b/My Python Notebook (Pramod)-I.ipynb
@@ -0,0 +1,15581 @@
+{
+ "cells": [
+  {
+   "cell_type": "markdown",
+   "metadata": {
+    "toc": true
+   },
+   "source": [
+    "<h1>Table of Contents<span class=\"tocSkip\"></span></h1>\n",
+    "<div class=\"toc\"><ul class=\"toc-item\"><li><span><a href=\"#Python-Introduction\" data-toc-modified-id=\"Python-Introduction-1\"><span class=\"toc-item-num\">1&nbsp;&nbsp;</span>Python Introduction</a></span><ul class=\"toc-item\"><li><span><a href=\"#Math-Operators-from-Highest-to-Lowest-Precedence\" 
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
```

-  We've modified our README file. But we've seen all this before. We got to a remote repository set up on GitHub. So let's use it. We can send our changes to that remote repository by using the git push command which will gather all the snapshots we've taken and send them to the remote repository. 


```console
$ git push
```

```console
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 363 bytes | 363.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/iampramodyadav/Mynotes.git
   b31ca6e..e090936  main -> main

Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$
```

- When we access our project, we see the contents of the README file. So if we check our repository on GitHub, we should see the updated message.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/mynotes (main)
$ git pull
```

```console
Already up to date.
```

### Summary: Basic Interaction with GitHub

There are various remote repository hosting sites:

- [GitHub](http://github.com/)
- [BitBucket](https://bitbucket.org/product)
- [Gitlab](https://gitlab.com/)


Follow the workflow at https://github.com/join to set up a free account, username, and password. After that, [these steps](https://help.github.com/articles/create-a-repo/) will help you create a brand new repository on GitHub.

Some useful commands for getting started:

Command
Explanation & Link

- git clone URL - [Git clone is used to clone a remote repository into a local workspace](https://git-scm.com/docs/git-clone)

- git push - [Git push is used to push commits from your local repo to a remote repo](https://git-scm.com/docs/git-push)

- git pull - [Git pull is used to fetch the newest updates from a remote repository](https://git-scm.com/docs/git-pull)


This can be useful for keeping your local workspace up to date.

https://help.github.com/en/articles/caching-your-github-password-in-git

https://help.github.com/en/articles/generating-an-ssh-key
  


# Using a Remote Repository


- There are a bunch of ways to host remote repositories. As we called out, there is many internet-based Git hosting providers like GitHub, BitBucket or GitLab which offer similar services.
- We can also set up a Git server on our own network to host private repositories. A locally hosted Git server can run on almost any platform including Linux, mac OS, or Windows. 
- This has benefits like increased privacy, control, and customization.
- To understand remote repositories, and Git's distributed nature a bit better, imagine you're working together with some friends to design a computer game, each of you has a different portion of the game you're responsible for. 
- One person is designing the levels, another the characters while others are writing the code for the graphics, physics, and gameplay. 
- All these areas will have to come together into a single place for the final product. Although your friends might work on their parts by themselves, from time to time, everyone needs to send out progress updates to let each other know what they've been working on.
- If you have your own local changes when you pull down the code from the remote repo, you might need to fix merge conflicts before you can push your own changes. 
- In this way Git let's multiple people work on the same project at the same time. When pulling new code it will merge the changes automatically if possible or will tell us to manually perform the integrating if there are conflicts. 
-  So when working with remotes the workflow for making changes has some extra steps. 
- We’ll still modify, stage and commit our local changes. 
- After committing, we'll fetch any new changes from the remote repo manually merge if necessary and only then will push our changes to the remote repo. 
- Git supports a variety of ways to connect to a remote repository. Some of the most common are using the HTTP, HTTPS and SSH protocols and their corresponding URLs.

- The distributed nature of the work means that there are no limits to how many people can push code into a repository. 
- It's a good idea to control who can push codes to repos and to make sure you give access only to people you trust.

- Web services like GitHub, offer a bunch of different mechanisms to control access to Repositories.
- Some of these are available to the general public while others are only available to enterprise users.

## Working with remotes

- When we call a `git clone` to get a local copy of a remote repository, Git sets up that remote repository with the default origin name. 
- We can look at the configuration for that remote by running `git remote -v` in the directory of the repo.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb
$ cd Mynotes
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git remote -v
```

```console
origin  https://github.com/iampramodyadav/Mynotes.git (fetch)
origin  https://github.com/iampramodyadav/Mynotes.git (push)
```

- Here we see the URLs associated with the origin remote. There are two URLs. One will be used to fetch data from the remote repository, and the other one to push data to that remote repo.

- But in some cases, you can have the fetch URL use HTTP for read only access, and the push URL use HTTPS or SSH for access control. This is fine as long as the contents of the repo that you read when fetching are the same that you write to in pushing. 

- Remote repositories have a name assigned to them, by default, the assigned name is origin. This lets us track more than one remote in the same Git directory.

- If we want to get even more information about our remote, we can call git remote show origin. 

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git remote show origin
```

```console
* remote origin
  Fetch URL: https://github.com/iampramodyadav/Mynotes.git
  Push  URL: https://github.com/iampramodyadav/Mynotes.git
  HEAD branch: main
  Remote branch:
    main tracked
  Local branch configured for 'git pull':
    main merges with remote main
  Local ref configured for 'git push':
    main pushes to main (up to date)
```

- Once you start having more branches, especially different branches in the local and remote repo, this information starts becoming more complex.

- Whenever we're operating with remotes, Git uses **remote branches** to keep copies of the data that's stored in the remote repository.

- We could have a look at the remote branches that our Git repo is currently tracking by running `git branch -r`.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git branch -r
```

```console
  origin/HEAD -> origin/main
  origin/main

```

- These branches are read only. We can look at the commit history, like we would with local branches, but we can't make any changes to them directly.

- To modify their contents, we'll have to go through the workflow we called out before. First, we pull any new changes to our local branch, then merge them with our changes and push our changes to the repo. 

- We can also use git status to check the status of our changes in remote branches as well. 

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git status
```

```console
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

## Fetching new changes

- our colleague added some files to our repo. 

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git remote show origin
```

```console
* remote origin
  Fetch URL: https://github.com/iampramodyadav/Mynotes.git
  Push  URL: https://github.com/iampramodyadav/Mynotes.git
  HEAD branch: main
  Remote branch:
    main tracked
  Local branch configured for 'git pull':
    main merges with remote main
  Local ref configured for 'git push':
    main pushes to main (local out of date)
```

- Check out how it says that the local branches are out of date.
- This happens when there were commits done to the repo that aren't yet reflected locally. 
- Git doesn't keep remote and local branches in sync automatically, it waits until we execute commands to move data around when we're ready. 
- To sync the data, we use the `git fetch` command.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git fetch
```

```console
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 949 bytes | 67.00 KiB/s, done.
From https://github.com/iampramodyadav/Mynotes
   e090936..ab37b5c  main       -> origin/main

```

- Fetched content is downloaded to the remote branches on our repository. So it's not automatically mirrored to our local branches. We can run git checkout on these branches to see the working tree, and we can run git log to see the commit history

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git log origin/main
```

```console
commit ab37b5c0260644402ffda5b783e411092bfda97e (origin/main, origin/HEAD)
Author: Pramod Kumar Yadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Sun Feb 25 17:40:29 2024 +0530

    Create testFile.md

commit e09093693c90e840b50398a53f3f9983c30283d5 (HEAD -> main)
Author: iampramodyadav <pkyadavc01234@gmail.com>
Date:   Sun Feb 25 12:42:58 2024 +0530

    Add one more line to readme.

commit b31ca6e85c1226ef4174b8bff8edd8c58c8d72e3
Author: iampramodyadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Wed Feb 24 14:24:14 2021 +0530

    Add files via upload

commit d8ec11e0a2a9118e9d0598586d689c8e95597f9b
Author: iampramodyadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Wed Feb 24 14:22:49 2021 +0530

    Initial commit

```

- Looking at this output, we can see that the remote origin/branch is pointing to the latest commit. (ie `(HEAD -> main)`)
- While the local master(main) branch is pointing to the previous commit we made earlier on. Let's see what happens if we run git status now.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git status
```

```console
On branch main
Your branch is behind 'origin/main' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)

nothing to commit, working tree clean

```

- Git status helpfully tells us that there's a commit that we don't have in our branch. It does this by letting us know our branches behind their remote origin/main branch.

- If we want to integrate the branches into our main branch, we can perform a merge operation, which merges the origin/main branch into our local main branch. To do that, we'll call `git merge origin/main`

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git merge origin/main
```

```console
Updating e090936..ab37b5c
Fast-forward
 testFile.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 testFile.md

Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

- If we look at the log output on our branch now, we should see the new commit

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git log origin/main
```

```console
commit ab37b5c0260644402ffda5b783e411092bfda97e (HEAD -> main, origin/main, origin/HEAD)
Author: Pramod Kumar Yadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Sun Feb 25 17:40:29 2024 +0530

    Create testFile.md

commit e09093693c90e840b50398a53f3f9983c30283d5
Author: iampramodyadav <pkyadavc01234@gmail.com>
Date:   Sun Feb 25 12:42:58 2024 +0530

    Add one more line to readme.

commit b31ca6e85c1226ef4174b8bff8edd8c58c8d72e3
Author: iampramodyadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Wed Feb 24 14:24:14 2021 +0530

    Add files via upload

commit d8ec11e0a2a9118e9d0598586d689c8e95597f9b
Author: iampramodyadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Wed Feb 24 14:22:49 2021 +0530

    Initial commit

```

- We see that now our master branch is up to date with the remote origin/master branch.(i.e. `(HEAD -> main, origin/main, origin/HEAD)`) 
- With that, we've updated our branch to the latest changes. 
- We can use git fetch like this to review the changes that happen in the remote repository.

- note: `git fetch` fetches remote updates but doesn't merge; `git pull` fetches remote updates and merges.


## Updating the local repository

`git pull`

- Earlier, we took a look at the basic workflow for working with remotes when we want to fetch the changes manually, merge if necessary, and only then push any changes of our own.
- Since fetching and merging are so common, Git gives us the `git pull` command that does both for us. 
- Running git pull will fetch the remote copy of the current branch and automatically try to merge it into the current local branch.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git pull
```

```console
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 978 bytes | 88.00 KiB/s, done.
From https://github.com/iampramodyadav/Mynotes
   ab37b5c..ebc02c5  main       -> origin/main
Updating ab37b5c..ebc02c5
Fast-forward
 testFile.md | 2 ++
 1 file changed, 2 insertions(+)
```
- If you look closely at this output, you'll see that it includes the output of the fetch and merge commands that we saw earlier. 
- First, Git fetched the updated contents from the remote repository, including a new branch. 
- And then it did a fast-forward merge to the local master branch. We'll see that the atestFile.md file was updated as well.


- We can look at the changes by using git log -p -1.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git log -p -1
```

```console
commit ebc02c5f5a2b8b03b1afe23d4c5d7ae7adde2134 (HEAD -> main, origin/main, origin/HEAD)
Author: Pramod Kumar Yadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Sun Feb 25 18:01:09 2024 +0530

    a new subheading added testFile.md

diff --git a/testFile.md b/testFile.md
index 46a432b..d5b6807 100644
--- a/testFile.md
+++ b/testFile.md
@@ -1 +1,3 @@
 # git learning
+
+## this a new sub heading change on web
```

- I created a new **Branch** named *experimental* on github via web ui

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git pull
```
.
```
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 958 bytes | 63.00 KiB/s, done.
From https://github.com/iampramodyadav/Mynotes
 * [new branch]      experimental -> origin/experimental
Already up to date.
```

- When we called git pull, we saw that there was also a new remote branch called experimental

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git remote show origin
```

```console
* remote origin
  Fetch URL: https://github.com/iampramodyadav/Mynotes.git
  Push  URL: https://github.com/iampramodyadav/Mynotes.git
  HEAD branch: main
  Remote branches:
    experimental new (next fetch will store in remotes/origin)
    main         tracked
  Local branch configured for 'git pull':
    main merges with remote main
  Local ref configured for 'git push':
    main pushes to main (up to date)
```

- We see that there's a new remote branch called experimental, which we don't have a local branch for yet. To create a local branch for it, we can run git checkout experimental.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git checkout experimental
```

```console
Switched to a new branch 'experimental'
branch 'experimental' set up to track 'origin/experimental'.
```

- When we checked out the experimental branch, Git automatically copied the contents of the remote branch into the local branch. 
- The working tree has been updated to the contents of the experimental branch. Now we're all set to work on the experimental feature together with our colleague.


-  If we want to get the contents of remote branches without automatically merging any contents into the local branches, we can call `git remote update`. 
- This will fetch the contents of all remote branches, so that we can just call checkout or merge as needed.


## Summary: Git Remotes


| Command                | Explanation & Links                                                                                                |
|------------------------|--------------------------------------------------------------------------------------------------------------------|
| git remote             | [$ git remote](https://git-scm.com/docs/git-remote)  allows you to manage the set of repositories or “remotes” whose branches you track.                  |
| git remote -v          | [$ git remote -v](https://git-scm.com/docs/git-remote#Documentation/git-remote.txt--v)  is similar to $ git remote, but adding the -v shows more information such as the remote URL.      |
| git remote show <name> | [$ git remote show <name>](https://git-scm.com/docs/git-remote#Documentation/git-remote.txt-emshowem)  shows some information about a single remote repo.                                       |
| git remote update      | [$ git remote update](https://git-scm.com/docs/git-remote#Documentation/git-remote.txt-emupdateem)  fetches updates for remotes or remote groups.                                                 |
| git fetch              | [$ git fetch](https://git-scm.com/docs/git-fetch)  can download objects and refs from a single repo, a single URL, or from several repositories at once. |
| git branch -r          | [$ git branch -r](https://git-scm.com/docs/git-branch#Documentation/git-branch.txt--r)  lists remote branches and can be combined with other branch arguments to manage remote branches.  |



- **A fast-forward merge** is a type of merge that does not create a new merge commit. Instead, it simply moves the branch pointer forward to point to the latest commit on the target branch.
- **An implicit merge** is a type of merge that is performed when you merge a branch that is already up-to-date with the target branch. In this case, no new merge commit is created, since there are no changes to merge.
- **A squash merge** is a type of merge that combines all of the commits on the source branch into a single commit on the target branch. This is useful for cleaning up the commit history and making it easier to read.
- **An explicit merge** is a type of merge that always creates a new merge commit, even if the source branch is already up-to-date with the target branch. This is useful for keeping track of the history of merges in your project.

# Secure shell & API Keys

Secure Shell (SSH) is a robust protocol for connecting to servers remotely. In the realm of remote server access, security is going to be more and more important to keep your information safe. Secure Shell is primarily used for logging in to Linux servers, Unix servers, and certain networking equipment such as routers. 

**Alternatives to SSH**

* SSH provides a shield against prying eyes, but how does it compare to its alternatives?  

* Telnet is one popular alternative. Telnet exposes your typed commands, including passwords, to anyone on the network equipped with the right tools. 

* Although Transport Layer Security (TLS) encrypts data within web browsers, SSH secures data in interactive terminal sessions or file transfers. This encryption ensures that * sensitive information remains confidential during communication. 

* Another alternative is virtual private networks (VPNs). VPNs also offer encryption but grant access to entire networks after connection. SSH adheres to the principle of * least privilege, restricting users to specific hosts, enhancing security. 

* Another option might be remote-control software like VNC or GoToMyPC. They focus on graphical user interfaces and desktop experiences, which may not align with most Linux * servers that operate sans desktop environments.

**Operation**

* SSH operates through two key components: the SSH server and the SSH client. The SSH server, residing on the target server, establishes secure network connections, undergoes mutual authentication, and initiates encrypted login sessions or file transfers. 

* Conversely, the SSH client establishes a connection to the SSH server, ensuring a secure interaction. The client makes requests, such as “log me in” or “copy this file.”

**SSH keys**

* In the SSH protocol, an access credential is known as an SSH key. It serves a similar purpose as usernames and passwords, although system administrators and power users typically use the keys to automate procedures and achieve single sign-on.

* Displaying the fingerprint of an SSH key is a useful way to verify that you're using the correct key and that the remote server's key hasn't been tampered with. To display the fingerprint of an SSH key, you can use the ssh-keygen command-line tool. 

**Key takeaways**

- *SSH prioritizes security in remote server access:* Secure Shell (SSH) is a robust and trusted protocol for securely connecting to servers remotely. It finds widespread use in accessing Linux servers, Unix servers, and specific networking equipment, serving as a shield against unauthorized access and data breaches. 

- *Comparing SSH with alternatives:* When you compare SSH to alternatives like Telnet, its security superiority becomes clear. Telnet exposes commands, including passwords, to potential threats, whereas SSH's encryption guarantees confidentiality during interactive terminal sessions and file transfers. Unlike virtual private networks (VPNs) that offer network-wide access, SSH adheres to the principle of least privilege, ensuring users are restricted for enhanced security.

- *SSH's operational mechanics and key role:* SSH functions through two core components: the SSH server and the SSH client. The SSH server establishes secure connections, authenticates parties involved, and initiates encrypted sessions. Conversely, the SSH client establishes secure interactions with the server and enables actions like secure login or file copying.

Just like a password, the security of your SSH key is critical. Never share your SSH private key with anyone or put SSH keys into your application code. With someone having access to your information, they can gain unauthorized access by logging in and pretending to be you.


## The SSH protocol

When discussing computer networks, the word “shell” refers to a program that provides an interface for accessing another operating system. With all the effort you put into keeping your own machine secure, you certainly want security when it’s connected to another machine. The Secure Shell network protocol, usually shorthanded to “SSH,” allows secure access to a computer over an unsecured network. 

**What is a protocol?**

- A protocol is a set of rules for how two things should communicate with each other. You may have heard the phrase “military protocol,” which refers to the strict guidelines that govern communications between members - of the armed forces in all situations. 
- In the case of computer protocols, these are usually published as open standards so that any given protocol - can be implemented in various products. Having these protocols readily available to everyone means that any - machine or network that implements a given protocol should be able to communicate seamlessly with anything - else that supports the same protocol. 
- For a deeper dive into Secure Shell, see [SSH protocol](https://www.ssh.com/academy/ssh/protocol). 

**The SSH protocol**

- So how does SSH secure the network? It works on the principle of public-key encryption. The client and the server each generate a strong encryption key for any data that is passed between them. Then, that key gets split in half, with the client retaining one portion and the server keeping the other. It’s a complex version of a simple idea, really; it’s not hard to imagine two people making up an encryption code and then tearing it in half for extra secrecy. 

- In SSH, the keys are split between a public key, the public half of the server’s encryption key, and the private key, which is stored only on the server. This way, a user’s machine can encrypt a message using the public key, but only the connected server can decode it because only the server’s private key will successfully decrypt the message. This way, if someone did intercept the network traffic, they still couldn’t read it because they don’t have the server’s private key. Using SSH, your keystrokes and the server’s responses are completely secure. 

For more on these keys, see [Public – private key pairs & how they work](https://www.preveil.com/blog/public-and-private-key/#:~:text=In%20public%20key%20cryptography%2C%20every,using%20their%20matching%20private%20key.) and [A Deep Dive on End-to-End Encryption](https://ssd.eff.org/module/deep-dive-end-end-encryption-how-do-public-key-encryption-systems-work). 

**Using the SSH protocol**

The SSH protocol is commonly used for logging in to servers remotely. While it is primarily used for logging in to Linux and Unix servers, it is also used to encrypt file transfers and to log in to some network equipment, like routers. 

Of course, your private key should never be transmitted to anyone else or shared anywhere. Most SSH clients will not connect if your private key is not protected from other users. Because your private key is unique to you, it can serve as both authentication and encryption, so the server doesn’t need to ask you for a password.

Besides providing a secure login shell on a remote server, SSH can be used for a number of other functions, including:

- Transferring files between client and server with SCP (Secure Copy Protocol) or SFTP (Secure File Transfer Protocol); for more about these types of file transfers, see the [Difference between SFTP and SCP](https://www.tutorialspoint.com/difference-between-sftp-and-scp).
- Forwarding network ports from server to client, or “tunneling”; for more on port forwarding, see [How to Use SSH Port Forwarding](https://phoenixnap.com/kb/ssh-port-forwarding).
- Relaying your login to yet another server behind a firewall, sometimes referred to as a “jump box” or “bastion host”; for more on this relaying method, see [How to Set Up an SSH Jump Server](https://goteleport.com/blog/ssh-jump-server/).
- Running graphical user interface (GUI) applications on a server but displaying them on a local client; for more on this, see [Use X forwarding on a personal computer](https://kb.iu.edu/d/bdnt). 

## Configuring SSH

Computer ports are software-based points where a network connection begins and ends. When using Secure Shell (SSH), the client connects to the server on port 22. After the connection is made, the server sends its public key to the client. Then the client and server negotiate a set of encryption rules, called an encryption algorithm, that both machines can support. When the two machines are in agreement on the encryption algorithm, the server starts a login shell for the user.

![SSH](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/pI1RKqVSSp21_OdEfwUMww_6cffd8ebb7084820bbc53b564ef0e1f1_BudE_s6geqadKlUkfb06AWNR4PFzNYzeb0-aOgYqQkSz2R2jbLYmKBT4ILRoxJ3_8Ew7lqJKd4JyZpRqTzhReNUSzUc40EUq34n_Fk819HY20sAjsyGolwZT4iGvyewpB8iZxGt075kRnnT9LO0ZaKw?expiry=1708992000000&hmac=DTKN7TnTl3Vm5RvZGU-nkhfeAcSq_yEHXPFFsoUOJNo)

**Configuring an SSH client**

SSH configuration instructions will be different depending on your operating system and the implementation of SSH. On the other hand, instructions for a client to generate its SSH key and connect to a server are more general. Let’s look at how to set up the command-line OpenSSH client and connect to a remote host for the first time. 

**Generating your key pair**

First, you will need to generate your public/private key pair. The first time you connect to a given server using SSH, the server will store a copy of its public key on your machine. This needs to be done only once, as the same key pair can be used to connect to any number of remote hosts.

Open a terminal and enter the command: 

`ssh-keygen -t rsa -b 2048`

OpenSSH will ask where to save the generated keys. Note that it will create a hidden directory called .ssh in your home directory. You can accept the defaults here. 

SSH will also ask you for a passphrase to protect your key. Many people choose not to use a passphrase because if you enter a passphrase here, you will be required to enter it every time your key is used. If you are on a machine that is not secure, however, someone who gains access to that computer will also have access to every system that uses that key. 

If you add a passphrase to your SSH key for added security, you can save the passphrase to an SSH agent, which is a program that manages SSH keys. For more about working with SSH key passphrases, see 
[Adding your SSH key to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent).


After you have set your passphrase or declined the option, OpenSSH will then generate a random public/private key pair and save it. Depending on your hardware, this may take several seconds to complete. OpenSSH will then return a message that your key has been saved and display the fingerprint and a “randomart image” of your new key. Here is an example:

```console
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/tradel/.ssh/id_rsa): 
Created directory '/Users/tradel/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /Users/tradel/.ssh/id_rsa
Your public key has been saved in /Users/tradel/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:0P4GpCFXlVoZPoQ8ULdqq9L0p2KTYlMwtOLXIwSxfO8 tradel@Todds-MacBook-Pro.local
The key's randomart image is:
+---[RSA 2048]----+
|  ..  .+oo=+     |
| ....  o+++.     |
|  ooo.+ o++      |
|  ..=+ *.. .     |
| . o +o S        |
|  . o.=. +       |
|   . =E+. o      |
|    = *....      |
|   . =.o.o       |
+----[SHA256]-----+
```

**Connecting for the first time**

Now that you have a key pair, you can connect to a host. The most basic form of the command to connect is:
`ssh <username>@<hostname>`.

When you connect to a server for the first time, SSH will print out the fingerprint of the remote server’s key and confirm that you really want to connect. The request will look like this:

```console
The authenticity of host 'my-host (192.168.1.10)' can't be established.
ED25519 key fingerprint is SHA256:KyE8fOzengv6CRTe1EXaeO7dtIF9JKM0VAcKf6sA0RM.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'my-host' (ED25519) to the list of known hosts.
```

You may be asked to enter the password for the account on the remote host. After you do this, a copy of your public key will be stored on the host, and you will not have to enter your password again. Your own copy of your key is sufficient to authenticate your connection. 

**Configuring an SSH server**

As we said earlier, SSH server configuration will vary based on your operating system and implementation of SSH. The SSH server component, called a “daemon,” is often installed by default on Linux and Unix. On Linux, the server configuration file is usually at `/etc/ssh/sshd_config` and rarely needs to be changed. 

If you try to connect to a host and see an error like `ssh: connection refused`, consult your operating system documentation for how to install and enable the SSH daemon. 

For use cases like increased security or managing user connections, see [How To Tune your SSH Daemon Configuration on a Linux VPS](https://www.digitalocean.com/community/tutorials/how-to-tune-your-ssh-daemon-configuration-on-a-linux-vps)

Later versions of MacOS also have a command-line SSH client already installed. For a free implementation of SSH for Windows, Mac, and Unix, see [PuTTY: a free SSH and Telnet client.](https://www.chiark.greenend.org.uk/~sgtatham/putty/)

**Pro Tips**

You can use the same private/public key pair across all the machines you control. So if you have two laptops and a tablet, you could copy your key pair to all of them. This can save you a few steps when logging in from other devices.

Once SSH is set up, if the public key sent by the server ever changes, SSH will warn you that something malicious may have happened to the server. You will receive an alert message that states the “Remote host identification has changed” or similar. You should contact your systems administrator if you see this message. Although it’s possible that the server has simply updated its key, it’s also possible that someone is eavesdropping on communications between you and an application in order to steal information. 


Optional features like port forwarding are often disabled by default because they open up potential security holes if they are misused. You may need these optional features to be enabled for something like forwarding network ports from a remote host to your local machine; for instance, if you want to access a service on the host (or the host's network) that is blocked by a firewall. If you need these optional features enabled, turn them on in the sshd_config file.

## API Keys

An Application Programming Interface (API) key is an authentication token that allows you to call an API. An application passes an API key to the API, which is then called to identify the person, programmer, or program trying to access a website. It is frequently accompanied by a set of access rights that are specific to the API the key is linked to. In this reading, you will delve into API keys, their role, their function in authentication and authorization, and how they are used. 

The API key is usually randomly generated by the application and must be sent on every API call. It serves as a distinctive identifier and offers a secure token for authentication.

**Authentication and authorization**

API keys may be used for both authentication, making sure you’re who you say you are, and authorization, deciding which APIs you are allowed to call.

When you are authenticating with API keys, you are ensuring that malicious users or applications can’t call an API and make unauthorized or authorized changes. With project authentication (application or site authentication), API keys help identify the project or application that makes the call. If you are using API keys for user authentication, the identity of the user is being verified. 

When you are authorizing with API keys, you are also ensuring that you have the correct API call. Authorization will also check that the API key being used in the project is available.

**How they are used**

- When using APIs, the usage depends on the specific API. With most APIs, you are required to send the API key with every request. It can be sent in one of several ways:

- As an HTTP parameter in the request URL. Example: `GET https://myapp.com/api/users/list?apikey=12345678`

- As an HTTP header sent with the request. Example: `GET https://myapp.com/api/users/listX-API-Key: 12345678 `

- (Rarely) Posted to a specific authorization endpoint, which returns another token or a cookie to be sent with subsequent requests. Example: `POST https://myapp.com/api/auth{ “token”: “12345678” }`

One last tip, do not hardcode API keys into your application code, especially if it will be posted in a public repository like Github. If you have hardcoded your API keys into your application code, anyone who wants to can make API calls with your authorization! 

Unfortunately, it happens every day. For this reason, many applications are moving away from API keys and toward OAuth, which requires the user to manually authorize an application before using it. With being extra cautious, you can make sure this does not happen to you. 

**Key takeaways**

- *API keys facilitate secure interactions:* The API key serves as a crucial authentication token that not only permits API calls, but also plays a vital role in regulating access privileges and defining permissible actions. It's an essential tool in ensuring secure and controlled communication within digital ecosystems.
- *Authentication and authorization:* API keys serve a dual purpose: authentication and authorization. Authentication verifies the identity of users or applications making API calls, preventing unauthorized access or changes. Authorization, on the other hand, ensures that users have the appropriate rights to call specific APIs, promoting controlled usage and adherence to access policies. 
- *Effective API key usage:* When using APIs, the API key can be included as an HTTP parameter in the URL or an HTTP header. Ensuring that API keys aren't hardcoded in application code is important in order to prevent unauthorized access. Many applications are transitioning from API keys to more secure methods where manual user authorization enhances security measures and minimizes risks associated with API misuse.


## When to use API Keys

Managing access and safeguarding resources is where API keys come into play. An API may require API keys for part or all of its methods. In this reading, we delve into the concept of API keys, exploring their pivotal role in not only securing and controlling access, but also in gathering insights to some processes API keys should not be used for. 

There are a few reasons why you might want to use API keys.

**What you can use API keys for**

Some of the ways you might use API keys include: 

- *To block anonymous traffic* - Can help to protect your API from abuse and to ensure that only authorized users are able to access it.

- *To control the number of calls made to your API* - Can help to prevent your API from being overloaded and to ensure that it is available to all authorized users.

- *To identify usage patterns* - Can be used to improve your API and to make sure that it is meeting the needs of your users.

- *To filter logs by API key* - Can help you to troubleshoot problems with your API and to identify which users are using your API the most.

**What you cannot use API keys for**

You can’t use API keys for: 

- *Identifying individual users* - API keys do not identify individual users; they identify entire projects.
- *Secure authorization* - They should be used only to identify and control access to an API.
- *Identifying the creators of a project* - Service Infrastructure doesn't provide a method to directly look up projects from API keys.

**Key Takeaways**

- You use API keys for blocking anonymous traffic, controlling the number of calls made to your API, identifying usage patterns, and to filter logs by API keys. 
- You can’t use API keys for identifying individual users, securing authorization, and identifying the creators of a project. 

API keys serve as the link between the potential of APIs and the demand for restricted usage. As developers continue to harness the power of APIs to weave intricate software ecosystems, a nuanced understanding of API keys' capabilities and boundaries becomes the cornerstone of ensuring secure, efficient, and insightful API management.

## Public vs. private keys

In a rapidly evolving world of technology, it is more critical than ever to establish security policies throughout an organization that safeguard valuable information and data assets. Asymmetric cryptography relies on public and private keys as its core building blocks to maintain data security and confidentiality in the face of dangers. However, to enable organizations to make wise decisions that will protect online interactions and information, it is important that we understand when public and private keys are used and how to do so effectively.

**What is a public key?**

A public key is frequently employed to establish secure communication through data encryption or to validate the authenticity of a digital signature. Safety is ensured because the public key comes from a trusted certificate authority, which gives digital certificates verifying the owner’s identity and key. Public keys are created through an asymmetric algorithm that conducts several operations on a pair of connected keys before being transmitted over the internet.

**What is a private key?**

A private key is a secret and secure key that must be kept confidential and protected. Its role involves decryption and the creation of digital signatures, assuring the data's integrity and authenticity. It is the counterpart of the public key and is shared to decrypt encoded information. Any data encrypted using the private key can be decrypted using the corresponding public key.

**How do public and private keys work together?**

Public and private keys work together to ensure secure communication, data encryption, digital signatures, and key exchanges take place safely across various communication channels. This process encompasses:

- Key generation: A public and private key is generated for both the sender and receiver.
- Key exchange: The public keys are exchanged between sender and receiver.
- Encryption: The sender encrypts their data using the recipient's public key.
- Transmitting encrypted data: The encrypted data is transmitted to the recipient.
- Decryption: The recipient decrypts the message using their exclusive private key.

## Key takeaway

In summary, although public and private keys are distinct, they work together to create a powerful and flexible foundation for achieving data security, confidentiality, integrity, and authentication in a wide range of digital settings.

---

# Solving conflicts

## The Pull-Merge-Push Workflow

We saw earlier how we can use the git push command to send our changes to the remote repo. But what if when we go to push our changes, there are new changes to the remote repo? To find out, let's start by making a change to our all checks py script.

- lets create a new file and committ
```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (experimental)
$ git checkout main
```

```console
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ notepad all_checks.py
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git add all_checks.py
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git status
```

```console
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   all_checks.py

```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git commit -m 'a new python code all_checks.py initial commit'
```

```console
[main 5264320] a new python code all_checks.py initial commit
 1 file changed, 26 insertions(+)
 create mode 100644 all_checks.py

Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git push
```

```console
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 651 bytes | 651.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/iampramodyadav/Mynotes.git
   ebc02c5..5264320  main -> main

```

- Now lets change the file from web: Done--> changed the doc string from  github web and committed

- Now change local also--> to create merg conflict

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ notepad all_checks.py
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git add -p
```

```console
diff --git a/all_checks.py b/all_checks.py
index e5b740b..c7cabf1 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -2,7 +2,9 @@ atom all_checks.py
 #!/usr/binenv python3
 (...)
 def check_disk_full(disk, min_gb, min_percent):
-    """Returns True if there isn't enough disk space, False otherwise."""
+    """Returns True if there isn't enough disk space, False otherwise.
+       adding extra line of doc string from local computer
+    """
     du = shutil.disk_usage(disk)
     # Calculate the percentage of free space
     percent_free = 100 * du.free / du.total
(1/1) Stage this hunk [y,n,q,a,d,e,?]? y
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git commit -m 'added extra line in doc string from local computer'
```
- We've made our change, staged it, and committed it. We should be ready to push into the remote repo, except now we have a collaborator also making changes. 

- Let's see what happens when we try running git push.


```console
[main a635203] added extra line in doc string from local computer
 1 file changed, 3 insertions(+), 1 deletion(-)

Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
```

```console
$ git push
To https://github.com/iampramodyadav/Mynotes.git
 ! [rejected]        main -> main (fetch first)
error: failed to push some refs to 'https://github.com/iampramodyadav/Mynotes.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.

```

- And it failed. There are a few hints. When we tried to push, Git rejected our change, that's because the remote repository contains changes that we don't have in our local branch that Git can't fast-forward.

- This means we need to sync our local remote branch with the remote repository before we can push. We learned earlier that we can do this with git pull. Let's do this now.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git pull
```

```console
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 1007 bytes | 53.00 KiB/s, done.
From https://github.com/iampramodyadav/Mynotes
   5264320..2ba2e46  main       -> origin/main
Auto-merging all_checks.py
CONFLICT (content): Merge conflict in all_checks.py
Automatic merge failed; fix conflicts and then commit the result.

```

- Git tried to automatically merge the local and remote changes to all_checks.py, but found a conflict.

- Let's first look at the tree of commits on all branches as represented by `git log --graph --oneline --all`.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main|MERGING)
$ git log --graph --oneline --all
```

```console
* a635203 (HEAD -> main) added extra line in doc string from local computer
| * 2ba2e46 (origin/main, origin/HEAD) Update all_checks.py from web
|/
* 5264320 a new python code all_checks.py initial commit
| * 5f3cd05 (origin/experimental, experimental) Created in a new branch experiment.py
|/
* ebc02c5 a new subheading added testFile.md
* ab37b5c Create testFile.md
* e090936 Add one more line to readme.
* b31ca6e Add files via upload
* d8ec11e Initial commit
```

- This graph shows us the different commits and positions in the tree. 
- We can see the main branch, the origin/main branch, and the experimental branch. 
- The graph indicates that our current commit and the commit in the origin/main branch share a common ancestor, but they don't follow one another. 
- This means that we'll need to do a **three-way merge.** 

- To do this, let's look at the actual changes in that commit by running `git log -p origin/main`.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main|MERGING)
$ git log -p origin/main
```

```console
commit 2ba2e4681e4eafb2de7d6271ab5f8201ce6f6ba6 (origin/main, origin/HEAD)
Author: Pramod Kumar Yadav <72774410+iampramodyadav@users.noreply.github.com>
Date:   Sun Feb 25 19:37:13 2024 +0530

    Update all_checks.py from web

diff --git a/all_checks.py b/all_checks.py
index e5b740b..62a6a2e 100644
--- a/all_checks.py
+++ b/all_checks.py
@@ -2,7 +2,11 @@ atom all_checks.py
 #!/usr/binenv python3
 (...)
 def check_disk_full(disk, min_gb, min_percent):
-    """Returns True if there isn't enough disk space, False otherwise."""
+    """Returns True if there isn't enough disk space, False otherwise.
+
+    Adding extra line to doc string from web
+
+    """
     du = shutil.disk_usage(disk)
     # Calculate the percentage of free space
     percent_free = 100 * du.free / du.total
@@ -23,4 +27,4 @@ def main():
     print("Everything ok")
     sys.exit(0)

-main()
\ No newline at end of file
+main()

commit 52643203afa8ba4160cf9580fafbaeeaad0e1335
Author: iampramodyadav <pkyadavc01234@gmail.com>
Date:   Sun Feb 25 19:31:26 2024 +0530

    a new python code all_checks.py initial commit

diff --git a/all_checks.py b/all_checks.py
new file mode 100644
index 0000000..e5b740b
--- /dev/null
+++ b/all_checks.py
@@ -0,0 +1,26 @@
+atom all_checks.py
+#!/usr/binenv python3
+(...)
+def check_disk_full(disk, min_gb, min_percent):
+    """Returns True if there isn't enough disk space, False otherwise."""
+    du = shutil.disk_usage(disk)
+    # Calculate the percentage of free space
+    percent_free = 100 * du.free / du.total
+    # Calculate how many free gigabytes
+    gigabytes_free = du.free / 2**30
+    if percent_free < min_percent or gigabytes_free < min_gb:
+        return True
+    return False
+
+def main():
+    if check_reboot():
+        print("Pending Reboot.")
+        sys_exit(1)
+    if check_disk_full(disk="/", min_gb=2, min_percent=10):
+        print("Disk full.")
+        sys.exit(1)
+
+    print("Everything ok")
+    sys.exit(0)
+
+main()
\ No newline at end of file

commit ebc02c5f5a2b8b03b1afe23d4c5d7ae7adde2134
```

- Let's fix it by editing the file to remove the conflict. 

```py
atom all_checks.py
#!/usr/binenv python3
(...)
def check_disk_full(disk, min_gb, min_percent):
    """Returns True if there isn't enough disk space, False otherwise.
<<<<<<< HEAD
	adding extra line of doc string from local computer
=======

    Adding extra line to doc string from web
    
>>>>>>> 2ba2e4681e4eafb2de7d6271ab5f8201ce6f6ba6
    """
    du = shutil.disk_usage(disk)
    # Calculate the percentage of free space
    percent_free = 100 * du.free / du.total
    # Calculate how many free gigabytes
    gigabytes_free = du.free / 2**30
    if percent_free < min_percent or gigabytes_free < min_gb:
        return True
    return False

def main(): 
    if check_reboot():
        print("Pending Reboot.")
        sys_exit(1)
    if check_disk_full(disk="/", min_gb=2, min_percent=10):
        print("Disk full.")
        sys.exit(1)
    
    print("Everything ok")
    sys.exit(0)

main()

```

- We see that the problem occurred doc string
- lets keep the both

```py
atom all_checks.py
#!/usr/binenv python3
(...)
def check_disk_full(disk, min_gb, min_percent):
    """Returns True if there isn't enough disk space, False otherwise.
	adding extra line of doc string from local computer

    Adding extra line to doc string from web
    
    """
    du = shutil.disk_usage(disk)
    # Calculate the percentage of free space
    percent_free = 100 * du.free / du.total
    # Calculate how many free gigabytes
    gigabytes_free = du.free / 2**30
    if percent_free < min_percent or gigabytes_free < min_gb:
        return True
    return False

def main(): 
    if check_reboot():
        print("Pending Reboot.")
        sys_exit(1)
    if check_disk_full(disk="/", min_gb=2, min_percent=10):
        print("Disk full.")
        sys.exit(1)
    
    print("Everything ok")
    sys.exit(0)

main()

```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main|MERGING)
$ git add all_checks.py
```

- Git will try to do all possible automatic merges and only leave manual conflicts for us to resolve when the automatic merge fails. 
- We can see that the other changes we made will be merged successfully without intervention. Only the change that happened in the same line of the file needed our input. 
- We fixed the conflict here, and the file is short enough that we can very quickly check that there are no other conflicts.

- For larger files, it might make sense to search for the conflict markers, >>> in the whole file. This lets us check that there are no unresolved conflicts left. 

- We need to add the all_checks.py file, and then call git commit to finish the merge.


```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main|MERGING)
$ git commit -m 'Keeping both line of doc string web and local'
```

```console
[main 0edeaf1] Keeping both line of doc string web and local
```

- Our merge is finally ready, we can try pushing to the remote again.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git push
```

```console
Enumerating objects: 10, done.
Counting objects: 100% (10/10), done.
Delta compression using up to 4 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 658 bytes | 658.00 KiB/s, done.
Total 6 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 2 local objects.
To https://github.com/iampramodyadav/Mynotes.git
   2ba2e46..0edeaf1  main -> main

```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git log --graph --oneline
```

```console
*   0edeaf1 (HEAD -> main, origin/main, origin/HEAD) Keeping both line of doc string web and local
|\
| * 2ba2e46 Update all_checks.py from web
* | a635203 added extra line in doc string from local computer
|/
* 5264320 a new python code all_checks.py initial commit
* ebc02c5 a new subheading added testFile.md
* ab37b5c Create testFile.md
* e090936 Add one more line to readme.
* b31ca6e Add files via upload
* d8ec11e Initial commit

Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$

```

- We see that the latest commit is the merge, followed by the two commits that caused the merge conflict, which are on split paths in our graph. As we called out before, when Git needs to do a three-way merge, we end up with a separate commit for merging the branches back into the main tree.


## Pushing remote branches

- So let's start a new branch to work on a small refactor of our code. 

- You could create the branch first, and then check it out or we can just create it and check it out with git checkout-b and the new branch name

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git checkout -b refactor
```

```console
Switched to a new branch 'refactor'
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ notepad all_checks.py
```

- Lets change this part of code,

```py
(...)
def main():
    if check_reboot():
        print("Pending Reboot.")
        sys.exit(1)
    if check_disk_full(disk="/", min_gb=2, min_percent=10):
        print("Disk full.")
        sys.exit(1)
(...)
```

- to this

```py
(...)
def check_root_full():
    """Returns True if the root partition is full, False otherwise."""
    return check_disk_full(disk="/", min_gb=2, min_percent=10)

def main():
    if check_reboot():
        print("Pending Reboot.")
        sys.exit(1)
    if check_root_full():
        print("Root partition full.")
        sys.exit(1)
(...)

```
-  Let's commit the change.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ git commit -a -m 'create wrapper function for check_disk_full'
```

```console
[refactor 7929abd] create wrapper function for check_disk_full
 1 file changed, 8 insertions(+), 2 deletions(-)
```

- lets change the code again

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ notepad all_checks.py
```

```py
(...)
def check_root_full():
    """Returns True if the root partition is full, False otherwise."""
    return check_disk_full(disk="/", min_gb=2, min_percent=10)

def main():
    checks = [
            (check_reboot, "Pending Reboot."),
            (check_root_full, "Root partition full"),
            ]

    for check, msg in checks:
        if check():
            print(msg)
            sys.exit(1)

    print("Everything ok.")
    sys.exit(0)
(...)
```

- lets committ again

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
```

```
$ git commit -a -m 'Iterate over a list of checks and messages to avoid code duplication'
[refactor 834936f] Iterate over a list of checks and messages to avoid code duplication
 1 file changed, 9 insertions(+), 6 deletions(-)

```
- lets make it more robust

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ notepad all_checks.py
```

```py
(...)    
def main():
    checks = [
            (check_reboot, "Pending Reboot."),
            (check_root_full, "Root partition full"),
            ]
everything_ok = True
    for check, msg in checks:
        if check():
            print(msg)
            everything_ok = False

    if not everything_ok:
        sys.exit(1)

    print("Everything ok.")
   sys.exit(0)
(...)
```


- lets committ again

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ git commit -a -m 'Allow printing more than one error message'
```

```console
[refactor 4c1cd68] Allow printing more than one error message
 1 file changed, 9 insertions(+), 6 deletions(-)
```

- With that, we have three commits and our refactor branch. Before we merge any of this into the master branch, we want to push this into the remote repo, so that our collaborators can view the code, test it, and let us know if it's ready for merging.

- We'll need to add the -u flag to create the branch upstream, which is another way of referring to remote repositories.

```
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ git push -u origin refactor
```

```console
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (9/9), done.
Writing objects: 100% (9/9), 1.24 KiB | 1.24 MiB/s, done.
Total 9 (delta 6), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (6/6), completed with 2 local objects.
remote:
remote: Create a pull request for 'refactor' on GitHub by visiting:
remote:      https://github.com/iampramodyadav/Mynotes/pull/new/refactor
remote:
To https://github.com/iampramodyadav/Mynotes.git
 * [new branch]      refactor -> refactor

```

- a new refactor branch has been created in the remote repo, which is what we wanted. 


## Rebasing your changes

- we mentioned that once our branch has been properly reviewed and tested, it can get merged back into the master branch. This can be done by us or by someone else.
- One option is to use the git merge command that we discussed earlier. Another option is to use the git rebase command.
- Rebasing means changing the base commit that's used for our branch.


- The problem with three way merges is that because of the split history, it's hard for us to debug when an issue is found in our code, and we need to understand where the problem was introduced.
- By changing the base where our commits split from the branch history, we can replay the new commits on top of the new base. This allows Git to do a fast forward merge and keep history linear.

- We run the command git rebase, followed by the branch that we want to set as the new base. When we do this, Git will try to replay our commits after the latest commit in that branch.

- Let's check out this process by rebasing our refactor branch onto the master branch. First, we'll check out the master branch and pull the latest changes in the remote repo. 


```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git checkout main
```

```console
Already on 'main'
Your branch is up to date with 'origin/main'.
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git pull
```

```console
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 990 bytes | 82.00 KiB/s, done.
From https://github.com/iampramodyadav/Mynotes
   0edeaf1..e89e3bd  main       -> origin/main
Updating 0edeaf1..e89e3bd
Fast-forward
 README.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

```

- Git tells us that it's updated the master branch with some changes that our colleague had made. 

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git log --graph --oneline --all
```

```console
* e89e3bd (HEAD -> main, origin/main, origin/HEAD) Update README.md on web a new line addes in readme
| * 4c1cd68 (origin/refactor, refactor) Allow printing more than one error message
| * 834936f Iterate over a list of checks and messages to avoid code duplication
| * 7929abd create wrapper function for check_disk_full
|/
*   0edeaf1 Keeping both line of doc string web and local
|\
| * 2ba2e46 Update all_checks.py from web
* | a635203 added extra line in doc string from local computer
|/
* 5264320 a new python code all_checks.py initial commit
| * 5f3cd05 (origin/experimental, experimental) Created in a new branch experiment.py
|/
* ebc02c5 a new subheading added testFile.md
* ab37b5c Create testFile.md
* e090936 Add one more line to readme.
* b31ca6e Add files via upload
* d8ec11e Initial commit
```

- As you can see, the refactor branch has three commits before the common ancestor, with the current commit that's at the head of the master branch. If we merged our branch now, it would cause a three way merge. But we want to keep our history linear. We'll do this with a rebase of the refactor against master.


```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git checkout refactor
```

```console
Switched to branch 'refactor'
Your branch is up to date with 'origin/refactor'.
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ git rebase main
```

```console
Successfully rebased and updated refs/heads/refactor.
```

- Let's look at the output of git log --graph --oneline for our branch right now. 
- `git rebase refactor` Move the current branch on top of the refactor branch

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ git log --graph --oneline
```

```console
* 7b74070 (HEAD -> refactor) Allow printing more than one error message
* 62271d9 Iterate over a list of checks and messages to avoid code duplication
* 37a1e3f create wrapper function for check_disk_full
* e89e3bd (origin/main, origin/HEAD, main) Update README.md on web a new line addes in readme
*   0edeaf1 Keeping both line of doc string web and local
|\
| * 2ba2e46 Update all_checks.py from web
* | a635203 added extra line in doc string from local computer
|/
* 5264320 a new python code all_checks.py initial commit
* ebc02c5 a new subheading added testFile.md
* ab37b5c Create testFile.md
* e090936 Add one more line to readme.
* b31ca6e Add files via upload
* d8ec11e Initial commit
```

- Now we can see the master branch and linear history with our list of commits. We're ready to merge our commits back onto the main trunk of our repo and have this fast forwarded. 

- To do that, we'll check out the master branch and merge the refactor branch.


```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (refactor)
$ git checkout main
```

```console
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git merge refactor
```

```console
Updating e89e3bd..7b74070
Fast-forward
 all_checks.py | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
```

- Awesome, we were able to merge our branch through a fast forward merge and keep our history linear. We're now done with our refactor and can get rid of that branch, both remotely and locally.

- We can now push changes back into the remote repo.
- To remove the remote branch, we'll call `git push --delete origin refactor`
- To remove the local branch, we'll call `git branch -d refactor`


```console
$ git push --delete origin refactor
```

```console
To https://github.com/iampramodyadav/Mynotes.git
 - [deleted]         refactor
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git branch -d refactor
```

```console
Deleted branch refactor (was 7b74070).
```

- We can now push changes back into the remote repo.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git push
```

```console
Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (9/9), done.
Writing objects: 100% (9/9), 1.25 KiB | 642.00 KiB/s, done.
Total 9 (delta 6), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (6/6), completed with 2 local objects.
To https://github.com/iampramodyadav/Mynotes.git
   e89e3bd..7b74070  main -> main
```

- we've just gone through an example using the git rebase command. We had a feature branch created against an older commit from master. So we rebased our feature branch against the latest commit from master and then merged the feature branch back into master.


### Another Rebasing example

- There are many other possible uses of rebase. One common example is to rebase the changes in the master branch when someone else also made changes and we want to keep history linear. This is a pretty common occurrence when you're working on a change that's small enough not to need a separate branch and your collaborators just happened to commit something at the same time.

- first lets make a change in the script

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ notepad all_checks.py
```

```py
atom all_checks.py

(...)
import socket
(...)
def check_root_full():
    """Returns True if the root partition is full, False otherwise."""
    return check_disk_full(disk="/", min_gb=2, min_percent=10)

def check_no_network():
    """Returns True if it fails to resolve Google's URL, False otherwise."""    
    try:
        socket.gethostbyname("www.google.com")
        return False
    except:
        return True

def main():
    checks = [
            (check_reboot, "Pending Reboot."),
            (check_root_full, "Root partition full"),
            (check_no_network, "No working network."),
            ]
(...)
```

- We've made the change, let's save it and commit it.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git commit -a -m 'Add a simple network connectivity check'
[main 87b6720] Add a simple network connectivity check
 1 file changed, 9 insertions(+)
```

- We want to check if one of our teammates also made a change in the master branch while we were working on our change.

- we showed how to do that by running git pull which will automatically create a three-way merge if necessary. 


- In this example, we want to look at a different approach to keep our project history linear. So we'll start by calling `git fetch`. 
- We'll put the latest changes into the origin slash master branch but we won't apply them to our local master branch.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git fetch
```

```console
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 987 bytes | 61.00 KiB/s, done.
From https://github.com/iampramodyadav/Mynotes
   7b74070..825f012  main       -> origin/main

```

- We see that we fetched some new changes.
- This means that if we tried to merge our changes, we end up with a three-way merge.
- Instead, we'll now run git rebase against our origin/master to rebase our changes against those made by our colleague and keep history linear. 

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git rebase origin/main
```

```console
Auto-merging all_checks.py
CONFLICT (content): Merge conflict in all_checks.py
error: could not apply 87b6720... Add a simple network connectivity check
hint: Resolve all conflicts manually, mark them as resolved with
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
hint: You can instead skip this commit: run "git rebase --skip".
hint: To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 87b6720... Add a simple network connectivity check

```

-  We've got a conflict and we'll need to fix it. 
- Git is giving us a lot of info on what it tried to do including what worked, what didn't work and what we can do about it. 
- Since we asked it to rebase, it tried to rewind our changes and apply them on top of what was in the origin/master branch.

- The output gives us a bunch of instructions on how to solve this. 
- We could fix the conflict, skip the conflicting commit or even abort the rebased completely. 
- In this example, we want to fix the conflict. 

So let's do that. We'll start by looking at the current state of the health_checks.py file.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ notepad all_checks.py
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git add all_checks.py
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git rebase --continue
```

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git log --graph --oneline
* 5521085 (HEAD -> main) rebase comment`
* 825f012 (origin/main, origin/HEAD) deleted a line on web all_checks.py
* 7b74070 Allow printing more than one error message
* 62271d9 Iterate over a list of checks and messages to avoid code duplication
* 37a1e3f create wrapper function for check_disk_full
* e89e3bd Update README.md on web a new line addes in readme
*   0edeaf1 Keeping both line of doc string web and local
|\
| * 2ba2e46 Update all_checks.py from web
* | a635203 added extra line in doc string from local computer
|/
* 5264320 a new python code all_checks.py initial commit
* ebc02c5 a new subheading added testFile.md
* ab37b5c Create testFile.md
* e090936 Add one more line to readme.
* b31ca6e Add files via upload
* d8ec11e Initial commit
```

- The difference is, that the commit history ended up being linear instead of branching out. We're now ready to push our new check to the remote repo.

```console
Asus@DESKTOP-19NOP2M MINGW64 ~/Desktop/GitHUb/Mynotes (main)
$ git push
```

```console
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 499 bytes | 499.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/iampramodyadav/Mynotes.git
   825f012..5521085  main -> main

```

- In this example, we've seen how we can use the fetch rebase push workflow to merge our changes with our collaborators changes while keeping the history of our changes linear. As we called out, keeping history linear helps with debugging especially when we're trying to identify which commit first introduced a problem in our project. We've now seen two examples of how to use the git rebase command. One for merging feature branches back into the main trunk of our code and one for making sure that our commits made in the master branch apply cleanly on top of the current state of the master branch and it doesn't stop there. We can also use git rebase to change the order of the commits or even squash two commits into one.


## Best Practices for Collaboration

- always synchronize your branches before starting any work on your own.
- avoid having very large changes that modify a lot of different things.
- when working on a big change, it makes sense to have a separate feature branch.
- regularly merge changes made on the master branch back onto the feature branch.
- If you need to maintain more than one version of a project at the same time, it's common practice to have the latest version of the project in the master branch and a stable version of the project on a separate branch.
- we can use rebase to make sure our history is linear.
- you shouldn't rebase changes that have been pushed to remote repos.
- having good commit messages is important.


## Summary: Conflicts resolution

In Git, merge conflicts, or conflicts that occur when merged branches have competing commits, are not uncommon when working with a team of developers or when working with open-source software. This study guide provides you with tips for resolving merge conflicts. 

**Tips for resolving merge conflicts**

- Here are some tips to keep in mind when you’re resolving merge conflicts: 

- After running Git merge, a message will appear informing that a conflict occurred on the file.

- Read the error messages that imply you cannot push your local changes to GitHub, especially the remote changes with Git pull. 

- Use the command line or GitHub Desktop to push the change to your branch on GitHub after you make a local clone of the repository for all other types of merge conflicts. 

- Before merging any commits to the master branch, push it into a remote repository so that collaborators can view the code, test it, and inform you that it’s ready for merging. 

- Use the Git rebase command to replay the new commits on top of the new base and then merge the feature branch back into the master.

*Key takeaways:*

It is important to effectively resolve merge conflicts because local changes cannot be made to Git until the merge conflicts have been locally resolved. Once all conflicts have been resolved, changes can be pushed to Git and merged in a pull request.



### Glossary terms 

*Application Programming Interface (API) key:* This is an authentication token that calls an API, which is then called to identify the person, programmer, or program trying to access a website

*Computer protocols:* Guidelines published as open standards so that any given protocol can be implemented in various products

Distributed: Each developer has a copy of the whole repository on their local machine

*GitHub:* A web-based Git repository hosting service, allowing users to share and access repositories on the web and copy or clone them to a local computer

*Merge:* An operation that merges the origin/master branch into a local master branch

*Private key:* A secret and secure cryptographic key that must be kept confidential and protected and is used to decrypt data that has been encrypted with the corresponding public key

*Public key:* A safety cryptographic structure frequently employed to establish secure communication through data encryption or to validate the authenticity of a digital signature

*Rebasing:* The base commit that's used for a branch is changed

*Remote branches:* Git uses read-only branches to keep copies of the data that's stored in the remote repository

*Remote repositories:* Repositories that allow developers to contribute to a project from their own workstations making changes to local copies of the project independently of one another

*Secure Shell (SSH):* A robust protocol for connecting to servers remotely

*SSH client:* This  establishes a connection to the SSH server, ensuring a secure interaction, where the client makes access requests

*SSH key:* An access credential

*SSH protocol:* Standard commonly used for logging in to servers remotely on the principle of public-key encryption

*SSH server:* This establishes secure network connections, undergoes mutual authentication, and initiates encrypted login sessions or file transfers

---


