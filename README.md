"# PowerShell-app" 
The monitoring Tool is a module I created. In my daily work, I was responsible for manually checking each machine's performance and error logs. This process was incredibly time-consuming, requiring individual attention to every machine. To streamline this task, I conceived the idea of creating a single module that could be easily imported into PowerShell. With this module, you can remotely access other machines to monitor their performance, view warnings, and check errors in their event logs. This project is still in its early stages of development, and I am actively working on it.

If you are interested in importing this module and use it, you can simply download the folder and place it in your PowerShell module path.
To find the PowerShell module path, enter this command:
$env:PSModulePath -split ';'
This will show you three directories, copy the module and paste it to the first directory.
Go to PowerShell and type: Import-Moddule MonitoringTool.
If you get an error, you need to check the module path again.
