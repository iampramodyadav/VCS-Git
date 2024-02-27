# Pull request

## Pull Request on github

**Forking**

- Forking is a way of creating a copy of the given repository so that it belongs to our user. 
- In other words, our user will be able to push changes to the forked copy, even when we can't push changes to the other repo. 
- When collaborating on projects hosted on GitHub, the typical workflows, first, create a fork of the repo, and then work on that local fork.
- A forked repo is just like a normal repo, except Github knows which repo it forked from. So we can eventually merge our changes back into the main repo by creating a pull request.

**Pull Request**

- A pull request is a commit or series of commits that you send to the owner of the repository so that they incorporate it into their tree.
- This is a typical way of working on GitHub, because in most projects, only a few people have commit rights to the repo. 
- But anybody can suggest patches, bug fixes or even new features by sending pull requests that people with commit access can then apply. Typically, the owners of the repo will review the changes before merging them. 

**[Creating a pull request-GitHub by using the web interface to edit files](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request#creating-the-pull-request)**



## The Typical Pull Request Workflow on GitHub

- We know how to create pull requests directly on GitHub by using the web interface to edit files. 
- This works for simple changes like fixing typos or adding documentation to a function, but it's not so great for making larger changes that we want to preview or test. 
- To do that, we'll normally have a local copy of the repo in our computer and work with the forked repo as a remote.


Steps-

- We'll go to the any repo and create a fork by pressing the Fork button.

	  It takes a few seconds to create a copy of the repo for our user. The copy will contain the current state of the repo including files and commit history. Once the fork is created, we're shown a page that corresponds to the same repo name, but it's under our user. See how it shows that it's a forked repo by stating the original repo under the name.

- We can now get a local copy of the forked repo on our computer by copying the URL and then calling the git clone command with it.

    Example:

	```console
	git clone https://github.com/redquinoa/rearrange.git
	```

	- We now have a new directory called rearrange with the contents of the repo.
    - We can look at the contents by changing into that directory, enlisting all files. We can look at the commit history using our old friend `git log`

	```console
	cd rearrange
	ls -l
	```

	```console
	git log
	```

- Now that we have a local copy of the repo, we can make any changes we'd like to it. if we added a readme file Save it and commit it. 

	```console
	git checkout -b add-readme
	```

	```console
	Switched to a new branch 'add-readme'
	```

	```console
	notepad readme.md

	Rearrange
	=========

	This module is used for rearranging names. 
	```

	```console
	git add README.md
	git commit -m 'Add a simple README.md file'
	```

	output

	```console
	[master 736d754] Add a simple README.md file

	 1 file changed, 4 insertions(+)

	 create mode 100644 README.md
	```



- Now, to push the change to our forked repo, we need to create the corresponding remote branch. 

	```console
	git push -u origin add-readme
	```

	Code output: 

	```console
	Code output: 

	Username for 'https://github.com': redquinoa

	Password for 'https://redquinoa@github.com': 

	Enumerating objects: 4, done.

	Counting objects: 100% (4/4), done.

	Delta compression using up to 4 threads

	Compressing objects: 100% (3/3), done.

	Writing objects: 100% (3/3), 400 bytes | 400.00 KiB/s, done.

	Total 3 (delta 0), reused 0 (delta 0)

	remote: 

	remote: Create a pull request for 'add-readme' on GitHub by visiting:

	remote:      https://github.com/redquinoa/rearrange/pull/new/add-readme

	remote: 

	To https://github.com/redquinoa/rearrange.git

	 * [new branch]      add-readme -> add-readme

	Branch 'add-readme' set up to track remote branch 'add-readme' from 'origin'.
	```


- We're ready to create a pull request for our change. To do that, let's look at the top of the Project page.

- GitHub tells us that our branch is ahead of the original repository's master branch by one commit, which is the commit we just made. We can start our pull requests by clicking on the Pull Request link.

- As we called out, before creating a pull request, it's always important to check that the code will merge successfully.

- GitHub tells us that our change can be automatically merged, which is great news. If this wasn't the case, we'd need to rebase our change against the current branch of the original repo so that it could be merged.

## Updating an Existing Pull Request

- When we send a pull request, it's pretty common to receive some comments from the project maintainers asking for some improvements.

- To get our change approved, it's important that you address the comments. So if we're asked to add documentation for example, we go and do it.

```console
atom README.md

Rearrange
=========

This module is used for rearranging names. 
Turns "LastName,FirstName" into "Firstname LastName"

# Example

Calling `rearrange_name("Turing, Alan")` will return `"Alan Turing"`
```

- Now we can add our changes and commit them to the repo as usual. Let's run git commit and pass a commit message saying that we've added more information to the README, and after that, we'll push the change to the repo.

```console
git commit -a -m 'Add more information to the README'
```

Code output: 

```console
[add-readme 01231b0] Add more information to the README

 1 file changed, 5 insertions(+)
```


```console
git push
```

```console
Code output: 

Username for 'https://github.com': redquinoa

Password for 'https://redquinoa@github.com': redquinoa

Enumerating objects: 5, done.

Counting objects: 100% (5/5), done.

Delta compression using up to 4 threads

Compressing objects: 100% (3/3), done.

Writing objects: 100% (3/3), 407 bytes | 407.00 KiB/s, done.

Total 3 (delta 1), reused 0 (delta 0)

remote: Resolving deltas: 100% (1/1), completed with 1 local object.

To https://github.com/redquinoa/rearrange.git

   736d754..01231b0  add-readme -> add-readme
```

- Now that we've pushed our change back to the repo, let's check our pull request in GitHub. In the Commit's tab, we can see our two commits.

- Our commit now shows up as a part of the same pull request. It's important to notice here that we just pushed our commit to the same branch as before and GitHub automatically added it to the pull request. If we wanted to create a separate pull request, we would need to create a new branch instead. 


## Squashing changes

- we shouldn't rewrite history when the commits have been published. That's because someone else may have already synchronized that repo with those contents. This rule is waived with pull requests, since it's usually only you who have cloned your fork of the repository. So say the project maintainers ask us to create a single commit that includes both changes and a more detailed description than the one we submitted.

- We can do that by using the interactive version of the rebase command called rebase-i, as the parameter to the command will pass the master branch. So we'll call git rebase-i master.

```console
git rebase -i master
```


- When we call an interactive rebase, a text editor opens with a list of all the selected commits from the oldest to the most recent.

- By changing the first word of each line, we can select what we want to do with the commits. The default action here is pick which takes the commits and rebases them against the branch we selected.

- This is what we do with git rebase in an earlier video when we called it without the dash i flag. But now we can change the action to something else.

- The comments in the file tells all the different commands we can use for our commits. For example, we can reword a commit message keeping the changes as they are but modifying the commit message.

- We can also edit the commit to add or remove changes from it. We have two options for combining commits, squash and fix up. In both cases, the contents of the selected commit are merged into the previous commit in the list. The difference is what happens with the commit messages. When we choose squash, the commit messages are added together and an editor opens up to let us make any necessary changes. When we choose fix up, the commit message for that commit is discarded.

- For our example, we want to use squash so that we can combine both commits but also modify the commit description. So let's change the pick command in the second line to squash it into the first one, then we'll save and exit the editor as usual.

```console
pick 736d754 Add a simple README file
pick 01231b0 Add more information to the README

(...)

```

```console
pick 736d754 Add a simple README file
squash 01231b0 Add more information to the README

(...)

```


- Once we've told git that we want to squash a commit unto the one before it, we're given another file to edit. In this case, it's the combined commit message.

```console
# This is a combination of 2 commits. 
# This is the 1st commit message:

Add a simple README file

# This is the commit message #2:

Add more information to the README

(...)
```

- We want to improve the description by adding more info about our change. Let's add we're including an example use case.

```console
# This is a combination of 2 commits. 
# This is the 1st commit message:

Add a simple README file including an example use case

# This is the commit message #2:

Add more information to the README

(...)
```

- our rebase worked.
- Let's check the output of git show to see the latest commit and the changes in it.



```console
git show
```

Code output:

```console
commit ae779e430288b082a19062ed087c547e1051a981 (HEAD -> add-readme)

Author: My name <me@example.com>

Date:   Tue Jan 7 09:47:17 2020 -0800

    Add a simple README file including an example use case

diff --git a/README.md b/README.md

new file mode 100644

index 0000000..5761a46

--- /dev/null

+++ b/README.md

@@ -0,0 +1,9 @@

+Rearrange

+=========

+

+This module is used for rearranging names.

+Turns "LastName, FirstName" into "FirstName LastName"

+

+# Example

+

+Calling `rearrange_name("Turing, Alan")` will return `"Alan Turing"`
```

- we got exactly what we wanted here, our two changes have been combined into one that contains the whole new file and the right commit message. Before we try to push this change to our repo, let's call git status to check the info that git gives us about the current state.


```console
git status
```

Code output:

```console
On branch add-readme

Your branch and 'origin/add-readme' have diverged,

and have 1 and 2 different commits each, respectively.

  (use "git pull" to merge the remote branch into yours)

nothing to commit, working tree clean
```


- Git tells us that our local branch has one commit, which is the rebase we just did. It also tells us that the origin/add-readme branch has two commits. These are the two commits we had already pushed to the repo.


```console
git log --graph --oneline --all -4
```

Code output:
```console
* ae779e4 (HEAD -> add-readme) Add a simple README.md file including an example use case

| * 01231b0 (origin/add-readme) Add more information to the README

| * 736d754 Add a simple README.md file

|/  

* 367a127 (origin/master, origin/HEAD, master) Add tests for the rearrange module
```

- We can see that the two commits pushed to the origin/add-readme branch show up in a different path than the commit that's currently in our local add-readme branch. This is expected whenever we do a rebase because the old commits are in the remote repo and we have a different commit in our local repo.

- What do you think will happen when we call git push?



```console
git push
```

Code output:

```console
Username for 'https://github.com': redquinoa

Password for 'https://redquinoa@github.com': redquinoa

To https://github.com/redquinoa/rearrange.git

 ! [rejected]        add-readme -> add-readme (non-fast-forward)

error: failed to push some refs to 'https://github.com/redquinoa/rearrange.git'

hint: Updates were rejected because the tip of your current branch is behind

hint: its remote counterpart. Integrate the remote changes (e.g.

hint: 'git pull ...') before pushing again.

hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

- Git doesn't like us trying to push our change because it can't be fast-forwarded. But in this case, we don't want to create a merge. Instead, we want to replace the old commits with the new one

- To do this, we will call git push -f to force git to push the current snapshot into the repo as is.

```console
git push -f
```

```console
Code output:

Enumerating objects: 4, done.

Counting objects: 100% (4/4), done.

Delta compression using up to 4 threads

Compressing objects: 100% (3/3), done.

Writing objects: 100% (3/3), 510 bytes | 510.00 KiB/s, done.

Total 3 (delta 0), reused 0 (delta 0)

To https://github.com/redquinoa/rearrange.git

 + 01231b0...ae779e4 add-readme -> add-readme (forced update)
```

```console
git log --graph --oneline --all -4
```

Code output:

```console
* ae779e4 (HEAD -> add-readme, origin/add-readme) Add a simple README.md file including an example use case

* 367a127 (origin/master, origin/HEAD, master) Add tests for the rearrange module

* c89805e Add the rearrange module

* f4ddbc7 Initial commit
```

- This time, it's just one commit on top of master. The divergence is gone. Now let's look at the contents of the pull request.

---

- We've managed to combine both are commits into one by using the interactive version of git rebase.
- We've managed to combine both are commits into one by using the interactive version of git rebase. Nice job in making it through these first videos. You now know how to create a pull request on GitHub, how to update a pull request, and squash changes. These tools are all super-helpful when using GitHub.


# Summary: Git forks and pull requests


GitHub is an open-source platform for collaboration and knowledge sharing, allowing users to explore code created by others. This study guide will provide you with pointers on effectively using the platform to make pull requests in the Git environment.

**Pull requests**

Pull requests allow you to inform fellow contributors about changes that have been made to a branch in Git. When pulling requests, you can discuss and evaluate proposed changes before implementing changes to the primary branch.

You can eventually merge changes back into the main repository (or repo) by creating a pull request. However, it is important to note that before any changes are made to the original code, GitHub creates a fork (or a copy of the project), which allows changes to be committed to the fork copy even if changes cannot be pushed to the other repo. Anyone can suggest changes through the inline comment in pull requests, but the owner only has rights to review and approve changes before merging them. To create a pull request:

- Make changes to the file.

- Change the proposal and complete a description of the change.

- Click the Proposed File Change button to create a commit in the forked repo to send the change to the owner.

- Enter comments about the change. If more context is needed about the change, use the text box.

- Click Pull Request.

When creating multiple commits, a number next to the pull request serves as the identifier for accessing the pull requests in the future. This is important because it allows project maintainers to follow up with questions or comments.  

For more information on creating pull requests, click the following link: [Creating a pull request ](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)

**Pull request merges**

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/C4nl1oqQSTu0dZT1j4L98Q_8d0d6fd1b8dc43d2b79ee99e6fd7f5f1_2xl_S7thfUImmrOHv7kbUeYXKDckZ7BSdT8i0PFVVSNhAkIZMmWCrgU7NiIU00sjWjUEXdTuRDaEQa6W7f-W0v1NICHE_LJG8C_HIEk6BCwIPnjA_yXRxCyAxJFIt9B-8r5tvsMYnAvQZ3Dlx7rvCARDCLIpeiDZKWXrA8jqmn-BejbtUSrIGVQvQMD8hqB1-E_hAFZQlhTL1KKlcEUgfAVj4Ujg7zTa8e8srA?expiry=1709164800000&hmac=NIrIR0vXmH1go1_7FAawAjYcDnCLBLWCeIS0F91rs-s)


You can merge pull requests by retaining the commits. Below is a list of pull request merge options that you can use when merging pull requests.

**Merge commits.** All commits from the feature branch are added to the base branch in a merge commit using the -- no–ff option. 

**Squash and merge commits.** Multiple commits of a pull request are squashed, or combined into a single commit, using the fast-forward option. It is recommended that when merging two branches, pull requests are squashed and merged to prevent the likelihood of conflicts due to redundancy.

**Merge message for a squash merge.** GitHub generates a default commit message, which you can edit. This message may include the pull request title, pull request description, or information about the commits.

**Rebase and merge commits.** All commits from the topic branch are added onto the base branch individually without a merge commit. 

**Indirect merges.** GitHub can merge a pull request automatically if the head branch is directly or indirectly merged into the base branch externally.

*Key takeaways*

Pull requests are a crucial tool you can use for efficiently capturing, implementing, and receiving approvals for changes. These capabilities are made possible through collaboration. Practicing pull requests can help you hone your skills and contribute to a project.


# Code review

*Doing a code review means going through someone else's code, documentation or configuration and checking that it all makes sense and follows the expected patterns.*

Reviews increased the number of eyes that have checked the code. This increases the code quality and reduces the amount of bugs.


On platforms like Github, it's common for projects to only requires reviews for people that don't have commit access while the project maintainers can commit directly. But doing code reviews improves the code's overall quality. Today, some open source projects and lots of companies require code reviews for everybody. 



## Code review workflow

- We'll check out a typical code review using a reviewing tool. Imagine we've just finished a bunch of code changes, now, we'll ask a reviewer to look at our code. The reviewer might say that everything is okay and our changes approved, but usually they'll find something that needs improving. So they'll add comments to our changes explaining what needs to be fixed and how. When we get the review comments will address them by fixing our typos, adding any missing tests and so on.

- After addressing a comment, we can mark it as resolved so that we know it's been taken care of. If there's something that we aren't sure how to do or we think a different approach might be better, we can reply to the comment and ask our reviewer for more information without marking the comment as resolved.

## How to use code reviews

-  let's check out how this process looks on GitHub, specifically.


- emember, a while back in this module, we created a pull request that added a read me file. Conveniently, our colleague just replied with a few comments. Let's have a look.

- The code review has one overall comment, and line by line, comments, highlighting the things that we need to get done.

- Our reviewer made three comments about our file. The first one is asking us to add a period at the end of the sentence. The second one asks us to add another hashtag which will make the title render and a smaller font. The last one will require a bit more work since it's asking us to include a couple more examples.

- Let's fix these. We'll add a period at the end of the second sentence, and then add a second hashtag before the example title, and finally, add a few more examples. 

- We've addressed all the comments in our code review. Let's save our file and then commit the changes.

```console
atom README.md

Rearrange
=========

This module is used for rearranging names.
Turns "LastName, FirstName" into "FirstName LastName".

## Examples

 * Calling `rearrange_name("Turing, Alan")` will return `"Alan Turing"`
 * Calling `rearrange_name("Hopper, Grace M.")` will return `"Grace M. Hopper"`
 * Calling `rearrange_name("Voltaire")` will return `"Voltaire"`
```


```console
git commit -a --amend
```

```console
git status
```

Code output:

```console
On branch add-readme

Your branch and ‘origin/add-readme’ have diverged,

And have 1 and 1 different commits, respectively

  (use “git pull” to merge the remote branch into yours)

Nothing to commit, working tree clean
```

- Using amend is pretty much the same as creating a new commit, and then using an interactive rebase to fix up a change.

- So, the commit gets replaced by a completely new commit with a completely different commit ID. This means that to push it, we'll need to use the dash F flag again.


```console
git push -f
```

Code output:

```console
Code output:

Username for 'https://github.com': redquinoa

Password for 'https://redquinoa@github.com': redquinoa

numerating objects: 4, done.

Counting objects: 100% (4/4), done.

Delta compression using up to 4 threads

Compressing objects: 100% (3/3), done.

Writing objects: 100% (3/3), 553 bytes | 553.00 KiB/s, done.

Total 3 (delta 0), reused 0 (delta 0)

To https://github.com/redquinoa/rearrange.git

 + ae779e4...55e32ed master -> master (forced update)
```

- Remember that forcing pushes is fine for pull request branches because nobody else should have cloned it. But this isn't something that we want to do with public repos.

- we've addressed all the comments. We can leave a message in our conversation to let our reviewer know that we've resolved all the comments and ask them to take another look.





## More Information on Code Reviews

Consistent coding standards are essential for large-scale projects, ensuring readability and maintainability. Google's style guides stand as prominent examples of how such norms can be established and adhered to across diverse teams. Code reviews are also essential in order to produce quality code. This reading delves into the principles of code review strategies and the significance of style guides, shedding light on their impact on software development practices and outcomes. You'll explore Google's style guides, learn about diverse code review strategies, and gain insights into the significance of pull request reviews.   

**Google style guides**

Every major open-source project includes a style guide, which is a set of norms for writing code for that project. When all of the code in a huge codebase is written in the same manner, it is considerably simpler to understand. 

You can find the project and style guide for Google code [here](https://github.com/google/styleguide).

**Code review**

Code review, also referred to as peer code review, is the deliberate and methodical gathering of other programmers to examine each other's code for errors. Code review can speed up and simplify the software development process, unlike other techniques. Peer reviews also save time and money, especially by catching the kinds of defects that could sneak through testing, production, and into the laptops of end users.

**Common code review strategies**

**Pair programming**

This method of building software places engineers side-by-side, working on the same code together. Pair programming is one of the defining characteristics of Extreme Programming (XP). It seems to integrate code review directly into the programming process and is a fantastic technique for senior engineers to mentor junior team members. However, different approaches to code review might offer greater objectivity because writers and even co-authors often become too familiar with their own work. Compared to other approaches, pair programming can require more staff and time resources.

**The email thread**

With the email thread strategy, a file is sent to the appropriate coworkers through email as soon as a particular piece of code is prepared for review, so they can individually review it. Although this method can be more adaptable and flexible than more conventional approaches, an email thread of suggestions and divergent opinions can become confusing very quickly, leaving the original coder to sort through it all.

**Over the shoulder**

One of the oldest, simplest, and most natural ways to participate in peer code review is the over-the-shoulder technique, which is more comfortable for most engineers than XP's pair programming. When your code is complete, ask a coworker to evaluate it while you explain why you created it that way. 

**Tool assisted**

Software-based code review tools, some of which are browser-based or seamlessly integrate into a range of common IDE and SCM development frameworks, are the final form of code review. Software tools enable reviews to happen asynchronously and non-locally, issuing notifications to the original coder when new reviews come in. The tools keep the review process moving efficiently with no meetings and no one having to leave their desks to contribute. Some technologies can also produce vital usage statistics that provide the audit trials and review metrics required for process improvement and compliance reporting.

**Pull request reviews**

A pull request (PR) is a procedure where new code is examined before it is merged to create a branch or master branch in GitHub. Before a pull request is merged, reviews give contributors the opportunity to comment on the modifications suggested in the request, accept the changes, or ask for additional changes. Administrators of the repository can mandate that each pull request be accepted before it is merged.

Anyone with read access can review and comment on the changes proposed in a pull request once it has been opened. Additionally, you can make precise changes to code lines that the author can implement right from the pull request. If you are interested in learning more about reviewing proposed changes in a pull request, click 
here.

**Five tips for pull request reviews**

Some of the considerations you should have with pull request reviews are:

1. *Be selective with reviewers:* It's important to select a reasonable number of reviewers for a pull request. Adding too many reviewers can lead to inefficient use of resources, as too many people reviewing the same code may not be productive.

2. *Timely reviews:* Ideally, reviews should be completed within two hours of the pull request being submitted. Delays in reviews can lead to context switching and hinder overall productivity. 

3. *Constructive feedback:* Feedback should be constructive and explain what needs to be changed and, more importantly, why those changes are suggested. Friendly and non-accusatory language fosters a positive and collaborative atmosphere.

4. *Detailed pull request description:* The pull request should include a detailed description that covers the changes made in the feature branch compared to the development branch, prerequisites, usage instructions, design changes with comparisons to mockups, and any additional notes that reviewers should be aware of. This information ensures that reviewers have a comprehensive understanding of the changes.

5. *Interactive rebasings:* Interactive Rebasings allow developers to modify individual commits without cluttering the commit history with redundant or unrelated changes. Keeping commits clean and relevant contributes to a more organized and maintainable codebase. 

**Key takeaways:**

- *Importance of consistent coding standards:* Maintaining uniform coding standards ensures readability and ease of maintenance. Google's style guides serve as prime examples of establishing and adhering to such norms across diverse teams.

- *Role of code reviews:* Code reviews, or peer code reviews, involve organized examination by fellow programmers, speeding up development and catching defects that might bypass testing, saving time and resources. 

- *Diverse code review strategies:* Pair programming, email threads, over-the-shoulder evaluations, and tool-assisted review strategies offer different levels of collaboration and objectivity, catering to different project needs.

- *Pull request reviews:* Pull request reviews provide an opportunity for collaborative examination of new code before integration. Accessible to those with read access, PR reviews enable inclusive feedback and ensure code quality through timely and constructive comments.   



# Managing Projects

- When working together with a large group of people, documenting what you do and why you do it becomes even more important, otherwise you'll spend most of your time answering everybody else's questions. 

-  The most basic form of this is writing clear code with good comments and documentation for those functions in the code.

- On top of that, you'll want to create documentation files to let others know how they can interact with your project like the readme.md file that we created in an earlier video. If you're a project maintainer, it's important that you reply promptly to pull requests and don't let them stagnate. The more time that passes until a pull request gets reviewed, the more likely it is that there's a new commit that causes a conflict when you try to merge in the change.

- Remember when you maintain a project especially if it's an open source project that volunteers are contributing to is that it's important that you understand any changes you accept.

- When it comes to coordinating who does what and when, a common strategy for active software projects is to use an issue tracker. This is a super useful tool.


## Tracking issue


- issue tracker or bug tracker can help us coordinate our work better. An issue tracker tells us the tasks that need to be done, the state they're in and who's working on them.

- Issue trackers aren't just useful for people actively working on projects. They also let users report bugs when they come across them, even if they don't know how to solve the problem. Sometimes users come across problems that we never even thought possible.


- There are a bunch of different solutions to track bugs or issues. There's a popular bug tracker called Bugzilla, which is used by quite a few open source projects. 

- On the flip side, platforms like GitHub have an issue tracker baked in. So, if you're hosting your project there, it can be very handy to track work on your project.


- When writing in issues description, it's a good idea to include all the information that we have about the problem or missing feature and any ideas on how to solve it. And if new information comes up later on, it can be added as additional comments on the same issue.

- The issues in the list all have numbers that identify them

- in GitHub, each issue or pull request in a project has a unique number associated with it. So, if we have a pull request with the ID five, there won't be an issue with ID five. GitHub will automatically reference issues and pull requests and comments when we mention them using the hash tag number format. For example, if we use #2 in a comment, it will automatically reference the issue we just created. If you're fixing an issue through a pull request, it's possible to automatically close the issue directly once the code is merged.

- To do this, you need to include a string like closes:#4 in your commit message or as a part of the description of your pull request. Once the code gets merged into the main tree, GitHub will automatically close the issue with a message linking it to the new commit. 

## Continuous Integration

- We can write automated tests to test the code for us and then use a continuous integration or CI system to run those tests automatically. A continuous integration system will build and test our code every time there's a change. 
-This means that it will run whenever there's a new commit in the main branch of our code. It will also run for any changes that come in through pull requests. In other words, if we have continuous integration configured for our project, we can automatically run our tests using the code in a pull request. 
- This way, we can verify that the test will pass after the new changes get merged back into the tree and that means instead of hoping our collaborators will remember to properly test their code, we can rely on our automated testing system to do it for us.


- *Once we have our code automatically built and tested, the next automation step is continuous deployment which is sometimes called continuous delivery or CD.*

- The goal is to avoid roll outs with a lot of changes between two versions of a project and instead do incremental updates with only a few changes at a time. This allows errors to be caught and fixed early.

- There's a large world of tools and platforms related to CICD which is what the whole system is usually called. One popular option is *Jenkins* which can be used to automate lots of different types of projects. Some repository hosting services like GitLab provide their own infrastructure for doing continuous integration. 

- GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform available through GitHub. the popular alternative is to use *Travis* which communicates with GitHub and can access the information from GitHub projects to know which integrations to run.

- No matter which tool you use, there are a bunch of concepts that you'll need to deal with when creating your own CICD. The first one is a concept of pipelines.

**pipelines**

Pipelines specify the steps that need to run to get the result you want. 
For a simple Python Project, the pipeline could be to just run the automated tests. For a web service written in Go, the pipeline could be compiled the program, run the unit tests and integration tests and finally deploy the code to a test instance.

Another concept that turns up when doing CICD is artifacts.

**artifacts**

This is the name used to describe any files that are generated as part of the pipeline. This typically includes the compiled versions of the code but can include other generated files like PDFs for the documentation or OS specific packages for easy installation. On top of this, you might want to keep the logs of the pipeline's build and test stages to review if things fail.


- make sure the authorized entities for the test servers are not the same entities authorized to deploy on the production servers. That way, if there's any kind of compromise in the pipeline, your production server is not affected.
- Second, always have a plan to recover your access in case your pipeline gets compromised. 

If you want to set up Travis for your GitHub project, you can do that by logging into the Travis website at www.travis-ci.com using your GitHub account then enable the projects that you want to continuously integrate. After that, you'll need to add a configuration file to your project written in YAML format that states the language your project is in, in which steps to take for the pipeline.


## Integrating git and GitHub


Git is a disconnected client/server application. This means that repositories are kept on a server and copied to your local machine. Some Git operations, like git push or git pull, will synchronize your copy with the remote repository.

While some organizations run their own private Git servers, most rely on a hosted solution. By far, the most popular is GitHub, but GitLab and Bitbucket are also in use. The Git command line can work with any of these.

**Integrating Git and GitHub**

You can use either HTTPS or SSH with the command-line Git client to interact with GitHub. If you are pushing a commit, or working with a private repository, you will need to authenticate. Authentication methods differ depending on whether you’re using HTTPS or SSH.

We’ll demonstrate several ways of using Git with your GitHub account.

**HTTPS authentication**

**Command-line with HTTPS**

Install the Git CLI according to your operating system. When you push to a GitHub repository over HTTPS, or clone a private repository, Git will prompt you for your GitHub username and password.

If you don’t want to enter your username and password every time, you can store them in a file called `.netrc` in your home directory, like this:  

```console
12345678
machine GitHub.com
    login my-username
    password my-password


machine api.GitHub.com
    login my-username
    password my-password
 ```

 Make sure the file is not readable by anyone else, or Git may ignore it.

**Command-line HTTPS with token**

Instead of storing your password in plaintext in the .netrc file, you can generate a personal access token and use that in place of your password. See 
Managing your personal access tokens
.

**Git Credential Manager**

Git Credential Manager (GCM) is a tool that securely stores your passwords and supplies them to Git without your intervention. It works on Linux, macOS, and Windows, and it supports multi-factor authentication too. You can read more about it 
here
.

**SSH authentication**

In the previous module, you learned how to generate an SSH key pair and use it for logging in to remote hosts. You can use the same SSH key to authenticate with GitHub. 

To add your SSH key for use with GitHub:

1. Find the public key you generated in the previous module. It will have a filename like id_rsa.pub.

2. Open GitHub.com in your browser.

3. Click on your profile icon in the top right corner and select Settings.

4. Go to SSH and GPG keys.

5. Click New SSH key.

6. Paste the contents of your public key into the text box and click Add SSH key.

*Key takeaways*

Integrating Git and GitHub is necessary for storing, sharing, and publishing your code. Git is responsible for everything GitHub-related that happens locally on your computer. GitHub is a cloud-based service that can store, share, and publish your code. Git and GitHub need to be able to communicate with each other.

## GitHub Project Management Tools

Besides serving as a repository for your code and tracking changes to your code over time, GitHub also includes tools to help manage your software project.

**GitHub Projects**

GitHub offers multiple tools to manage and plan your work. For example, GitHub Projects is a flexible tool for tracking and managing work on GitHub. You can use Projects to create an adaptable spreadsheet, task-board, and road map which integrates with your issues and pull requests. With GitHub projects, you can filter, sort, and group your issues and pull requests and customize to fit your team’s workflow. Projects can be created in a repository, and then issues can be added to them.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/R9fw2-o1SXiY2mmWvx5jkg_6410b27187ab4ef48c772aedce4bb9f1_MA2ouUDzMgP1V64RPuiv8Lz5rEpSBzIyHFcEO7RrjTTDvY5AxbtjqCSKUQH5JLVwcE8DbLhW1uMvBPqbZDHtzn1mL0Zuz6tNAlRBbB-jKaUc14DJscZZLtuLRRHf_UkCPmo4_Iu9HEsgzxYu_6IgVrgqYQ0DmXl9pl9AQAtvn99FkbbzgsGkERYt80FXWE?expiry=1709164800000&hmac=saEBI2i1V3VQP3S4UQzmjObAUQrC6Eh7a6fuJRB3roM)

**GitHub Issues**

GitHub Issues is a part of GitHub Projects, and it provides a way to track tasks that you need to complete. An issue can be a bug, a feature request, or a housekeeping task (like upgrading a library to the latest version). Issues can have extensive text and descriptions attached to them, including screenshots and snippets of code. Issues can be discussed, commented on, assigned to people, and tagged.


Here’s a screenshot of the top open issues for a very active Python application on GitHub:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/XVTgslqYRdG5i3BhLTnvbw_1628b64faab542a4b40ab3ff1b07a4f1_JF8yh5ck4RSMId4KqvNCmueJITp36mCGv7X6tnDyJgMtz-V_O-_SOVl9qQWx5urS9Q_JFLGBLhCwSVREeNiCeco8NyTEJ7NICMBX7V40xZ0dUzaeMpQqk1RCAnZoJ_eXyMPbLmWlxibb5x8ZnJ41mRs_tQ8u9USMOLgrTNL1lWv_xnOaZUTQC4H583xUk78?expiry=1709164800000&hmac=LkVneeEwaIzT-1uIkSvkgWRIpOIUWBepf-t-RX5gmLE)

**Traditional project management**

You can also view open issues in a more traditional project management format, with status, assignees, estimates, and more:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/qIQTxw93QqGuh9Q9g97l4Q_c2d749d989a24850a39eed52f6c532f1_XZserld5poTyf_SZYZVL38InGfXxuqI-ZosEgDV7HkuVsdpGjqSO66cPtfh5PjyrwyuBlM6VvGpKQofk0Wm_JM12rFW-Zzq428OyknKHzP8RrnWZhxQm384KYcT0buh1uYf-Qxw0_WXUl_jiOriLUHsBgg8W5fm7M3NAmxwCRddo_GwnI7gBtiuOm2lxc4s?expiry=1709164800000&hmac=k4bgkPzfgXai6Gk5AIPDyvxmO0Yqzgz6TprlzDQ9j-k)

GitHub also supports extensive automation. You can define workflows that update issues or projects automatically as issues change or comments are added. 


**Resources for more information**

- [A Quick Guide to Using GitHub for Project Management](https://www.jobsity.com/blog/a-quick-guide-to-using-github-for-project-management)

	- This article provides a brief overview of project management tools on GitHub.

- [GitHub for project management](https://openscapes.github.io/series/core-lessons/github/github-issues.html)

	- This lesson offers detailed descriptions of GitHub’s project management tools.

- [Using GitHub as your Project Management Tool](https://www.youtube.com/watch?v=qgQAFP6oSKw)
 

	- This video provides examples on GitHub  project management tools.

- [GitHub Issues: Project Planning for Developers](https://github.com/features/issues)
 

	- This GitHub page shows the many project management tools available for developers.



## Additional Tools

Check out the following links for more information:

- [Open source DIY ethics](https://arp242.net/diy.html)
- [Linking a pull request to an issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue)
- [Setting guidelines for repository contributors](https://help.github.com/en/articles/setting-guidelines-for-repository-contributors)
- [What is CI/CD? Continuous integration and continuous delivery explained](https://www.infoworld.com/article/3271126/what-is-cicd-continuous-integration-and-continuous-delivery-explained.html)
- [What Is CICD? What’s Important and How to Get It Right](https://stackify.com/what-is-cicd-whats-important-and-how-to-get-it-right/)
- [Travis CI Tutorial](https://docs.travis-ci.com/user/tutorial/)
- [Build Stages](https://docs.travis-ci.com/user/build-stages/)
 

# Glossary terms

**CI/CD:** The name for the entire continuous integration and continuous deployment system

**Code reviews:** The deliberate and methodical gathering of other programmers to examine each other's code for errors to increase the code quality and reduces the amount of bugs

**Continuous deployment (CD):** New code is deployed often after it has been automatically built and tested

**Continuous integration (CI):** A system that will automatically build and test our code every time there's a change

**Fix up:** The decision to discard commit messages for that commit 

**Forking:** A way of creating a copy of the given repository so that it belongs to our user

**Indirect merges:** GitHub can merge a pull request automatically if the head branch is directly or indirectly merged into the base branch externally

**Issue tracker (bug tracker):** A tracker that shows tasks that need to be done, the state they're in and who's working on them

**Merge commits:** All commits from the feature branch are added to the base branch

**Pipelines:** The specific steps that need to run to obtain the desired result

**Pull request:** A procedure where new code is examined before it is merged to create a branch or master branch 

**Squash commits:** The decision add commit messages together and an editor opens to make any necessary changes



# IT skills in action

Well done! You've gained a strong foundation in various crucial aspects of IT, from version control to project management. You’ve also practiced how to:

- Implement version control using git and Github
- Branch and merge your work
- Secure and restore repositories 
- Resolve code conflicts
- Run code reviews and manage pull requests
- Use versioning to track and manage projects

Now, let's put your skills into action with a real-world scenario that encompasses the lessons you've learned. 

**The project**

Imagine you're part of an IT team responsible for developing and managing a software project. Your team is using Git for version control, collaborating on coding tasks, and ensuring project success. Let's walk through the process step by step.

**Project steps**

*Before Version Control:* Before diving into code, ensure your team is aligned on the project's scope, goals, and responsibilities.

*Version control systems:* Choose Github as your version control system to track changes, collaborate effectively, and maintain a history of your project.

*Using git:* Start by initializing a Github repository, committing your initial code, and using git status and git log to manage and track changes.

*Advanced git interaction:* Use advanced commands like git diff to visualize changes, git stash to temporarily hide changes, and git tag to mark significant milestones.

*Undoing things:* Use git reset and git revert to undo changes and address errors in a controlled manner.

*Branching and merging:* Create branches for feature development using git branch, switch between branches with git checkout, and merge changes using git merge.

*Secure shells & API keys:* Ensure security by using SSH keys and managing sensitive data like API keys properly.

*Solving conflicts:* Resolve conflicts that arise from merging branches using git merge or pull requests.

*Pull requests:* Open pull requests to propose changes, review code, and discuss modifications with your team.

*Code reviews:* Participate in code reviews to maintain code quality, identify improvements, and ensure best practices.

*Managing projects:* Organize your project using project boards, milestones, and issues to track progress and prioritize tasks.

**Putting it all together**

Imagine you're assigned to add a new feature to your project: a user authentication system. Here's how you'd apply your skills:

*Before version control:* Working with your development team and stakeholders you define the feature's scope and priorities. From the business requirements you develop user stories from which the team can build out tasks. Review the tasks your team created and discuss expected outcomes.

*Version control systems:* You create a feature branch for the authentication system on the app's existing repository that is already located on github. Your team uses this new branch to begin to work on the tasks associated with the feature request.All progress is tracked in real time and documented with comments in Github.

```console
# Create a new feature branch
git checkout -b feature/user-authentication
```

*Advanced git interaction:* You use git diff to view and compare code changes and look back at the history of changes. When needed you can use git diff to compare whole branches as the feature becomes more robust. As you get closer to completing the feature you create tags to mark development milestones. When feature release is approaching, you can use a milestone to share progress with stakeholders.

```console
# View code changes

git diff

# View commit history

git log

# Create a new tag

git tag v1.0.0

# Compare branches

git diff feature/user-authentication main
```

*Undoing things:* As you encounter issues, you have stable milestones you know you can restore back. You can stash away pending changes or, safely undo changes using Git's commands.

```console
# Stash changes

git stash

# Restore changes from stash

git stash pop

# Undo changes in working directory

git checkout -- <file>
```

*Branching and merging:*  Your team makes sure to keep up with branching and merging changes. The team tests their changes in the feature branch to avoid introducing any issues or bugs into the main branch. 

```console
# Merge changes from feature branch to main

git checkout main

git merge feature/user-authentication

# Delete feature branch

git branch -d feature/user-authentication

Solving Conflicts: As code conflicts arise during merging, you attempt to automerge. When deeper conflicts arise, you gather your team and address them collaboratively.

# Attempt to automerge

git merge feature/user-authentication

# Resolve conflicts manually

# Edit files to resolve conflicts

git add <resolved-files>

git commit -m "Resolved conflicts"
```

*Pull requests and code reviews:* One of your team members opens up a pull request for your feature branch. It is finally time to merge our feature into the main branch. Automated tests run against the code in question and your team schedules a code review. You prepare to gather and track feedback.

```console
# Push changes and open pull request

git push origin feature/user-authentication

# Automated tests run in CI/CD pipeline

# Pull request is reviewed

# Feedback is addressed
```

*Code reviews:* All concerned parties participate in code reviews. Team members address the group and review their code additions. Tests and metrics are also reviewed. The team collaborates at addressing feedback and ensuring high-quality code.

*Managing projects:* Throughout the project, and even after development efforts have concluded, you continue to track the progress of your feature using project boards, milestones, and issues. Development is iterative and your team will continue to work on features as feedback and requests come in from stakeholders.

By applying your skills across the development life-cycle, you've successfully contributed to the project's growth and demonstrated your expertise in IT and project management.

*Key takeaways*

Throughout this guided activity, you've delved into the practical application of various IT skills, following a step-by-step process that encapsulates the skills you’ve learned. You've navigated the world of version control systems, using Git's essential functionalities, branching strategies, and remote repository interactions. With a keen eye for detail, you've tackled code reviews and confidently resolved conflicts, ensuring the seamless collaboration essential for effective software development. Your journey also encompassed essential project management aspects, where you employed project boards, milestones, and issue tracking to oversee and guide your projects' evolution. Feel confident to harness your IT skills in real-world contexts, paving the way for efficient, collaborative, and successful software development endeavors.


---


