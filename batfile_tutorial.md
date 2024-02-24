## Batch (cmd) Scripting

[Detail material](https://www.tutorialspoint.com/batch_script/index.htm)

[Windows Batch Scripting](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)

### Navigating Directories :

* `cd` : Change directory
* `dir` : List files and directories
* `mkdir` : Create a new directory
* `md` - Creates a new directory.
* `rmdir` : Remove a directory
* `tree` : Display directory structure

### Managing Files :

* `copy` : Copy files and directories
* `move` : Move or rename files and directories
* `del` : Delete files
* `ren` : Rename a file or directory
* `type` : Display file contents
* `find` : Search for a text string in a file
* `xcopy` : Copies files and directories recursively
* `where` : Displays the location of a file or command.
* `vol` : Displays the volume label of the current drive.

### System Information :

* `systeminfo` : Display system information
* `hostname` : Display the host name of the computer
* `ipconfig` : Display IP configuration information
* `tasklist` : Display a list of running processes
* `taskkill` : Terminate a running process

### Network Commands :

* `ping` : Send ICMP echo requests to a specified host
* `tracert` : Trace the route to a destination IP address
* `nslookup` : Perform DNS lookup on a domain name
* `netstat` : Display active network connections and listening ports
* `ipconfig` : Display IP configuration information

### Managing Services :

* `sc` : Control Windows services
* `net` : Manage network resources (shares, users, groups)
* `tasklist` : Display a list of running processes
* `taskkill` : Terminate a running process

### Batch Scripting :

* `set` - Sets a variable.
* `for` - Loop over a set of values.
* `if` - Conditionally execute a command.
* `while` - Loop while a condition is met.
* `echo` - Display text.
* `pause` - Pauses the batch file and waits for the user to press a key.
* `sort` - Sort a list of values.
* `findstr` - Find text in a file.
* `grep` - Find text in a file (Linux/Mac).
* `regedit` - Edit the Windows registry.
* `taskkill` - Kill a running process.
* `start` - Starts a program or another batch file.
* `shutdown` - Shut down or restart the computer.
* `shift` - Shifts the position of the command-line arguments.
* `goto` - Jumps to a label in the batch file.
* `call` - Calls a batch file from within another batch file.

### Miscellaneous :


* `help` : Display help information for CMD commands
* `cls` : Clear the console screen
* `exit` : Exit the CMD shell
* `chcp` : Change the active code page
* `title` : Set the window title
* `rem` : Comments out a line of code in the batch file
* `whoami` : Display the current user name.
* `whois` : Look up information about a domain name.
* `date` : Display the current date and time.
* `time` : Display the current time.
* `ver` : Displays the Windows version.


### Batch files

- A batch file is a text file that contains a series of commands. When the batch file is run, the commands in the file are executed one at a time. Batch files can be used to automate tasks, such as launching programs, copying files, or running scripts.

- To create a batch file, open a text editor and save the file with a .bat or .cmd extension. In the text editor, type the commands that you want to run. When you are finished, save the file and close the text editor.

- To run a batch file, open a command prompt and type the name of the batch file. For example, to run a batch file named "my_batch_file.bat", you would type the following command:

```
my_batch_file.bat
```

### PowerShell scripts

- PowerShell scripts are similar to batch files, but they are more powerful and versatile. PowerShell scripts can be used to do more than batch files can, such as managing Windows objects and interacting with web services.

- To create a PowerShell script, open a text editor and save the file with a .ps1 extension. In the text editor, type the PowerShell commands that you want to run. When you are finished, save the file and close the text editor.

- To run a PowerShell script, open a PowerShell console and type the name of the PowerShell script. For example, to run a PowerShell script named "my_powershell_script.ps1", you would type the following command:

```
./my_powershell_script.ps1
```

### examples for each CMD command:

Basic commands

* cd - Change directory.
```
cd C:\Windows
```

* dir - List files and directories.
```
dir
```

* mkdir - Create a directory.
```
mkdir my_new_directory
```

* rmdir - Remove a directory.
```
rmdir my_new_directory
```

* copy - Copy a file.
```
copy my_file.txt my_new_file.txt
```

* move - Move a file.
```
move my_file.txt my_new_file.txt
```

* del - Delete a file.
```
del my_file.txt
```

* ren - Rename a file.
```
ren my_file.txt my_new_file.txt
```

* type - Display the contents of a file.
```
type my_file.txt
```

* ipconfig - Display network configuration information.
```
ipconfig
```

* ping - Send a network ping.
```
ping www.google.com
```

* tracert - Trace the path to a network destination.
```
tracert www.google.com
```

* netstat - Display network connections.
```
netstat
```

* nslookup - Resolve a hostname to an IP address.
```
nslookup www.google.com
```

* whoami - Display the current user name.
```
whoami
```

* whois - Look up information about a domain name.
```
whois google.com
```

* date - Display the current date and time.
```
date
```

* time - Display the current time.
```
time
```

* help - Display help for a command.
```
help ipconfig
```

Advanced commands

* for - Loop over a set of values.
```
for /f "delims=" %%a in ('dir') do echo %%a
```

* if - Conditionally execute a command.
```
if "%1"=="" (
  echo No arguments were provided.
) else (
  echo One or more arguments were provided.
)
```

* while - Loop while a condition is met.
```
while 1==1 do (
  echo This will loop forever.
)
```

* echo - Display text.
```
echo This is some text.
```

* pause - Pause the command prompt.
```
pause
```

* sort - Sort a list of values.
```
sort < my_list.txt
```

* findstr - Find text in a file.
```
findstr "This is some text" my_list.txt
```

* grep - Find text in a file (Linux/Mac).
```
grep "This is some text" my_list.txt
```

* regedit - Edit the Windows registry.
```
regedit
```

* taskkill - Kill a running process.
```
taskkill /im notepad.exe
```

* start - Start a program.
```
start notepad.exe
```

* shutdown - Shut down or restart the computer.
```
shutdown /s
```


## mathematical operations in CMD:

* Addition

```
set /a num1=10
set /a num2=20
set /a sum=%num1%+%num2%
echo %sum%
```

This will print the result of 10 + 20, which is 30.

* Subtraction

```
echo off
set /a num1=10
set /a num2=20
set /a ans= %num1% - %num2%
echo %ans%
```

This will print the result of 10 - 20, which is -10.

* Multiplication

```
echo off
set /a num1=10
set /a num2=20
set /a ans= %num1% * %num2%
echo %ans%
echo on
```

This will print the result of 10 * 20, which is 200.

* Division

```
set /a num1=100
set /a num2=20
set /a ans=%num1% / %num2%
echo %ans% 
```

This will print the result of 100 / 20, which is 5.

* Modulo

```
set /a num1=100
set /a num2=20
set /a ans=%num1% % %num2%
echo %ans%
```

This will print the result of 100 % 20, which is 0.


- You can also use the calc command to perform mathematical operations. The calc command will open a calculator window, where you can enter the mathematical expression and press Enter to get the result.


---

