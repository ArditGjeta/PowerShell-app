# PowerShell Monitoring Tool
# Overview
The Monitoring Tool is a custom PowerShell module designed to simplify the process of remotely monitoring machine performance and event logs. This tool helps IT professionals by automating the collection of performance metrics, error logs, and warnings across multiple machines, saving significant time and effort in daily operations.

# Features
Remote Machine Monitoring: Remotely access and monitor the performance of other machines within your network.
Event Log Analysis: Quickly view warnings and errors in the event logs of remote machines.
Performance Metrics: Collect and analyze key performance indicators (KPIs) such as CPU usage, memory usage, disk activity, and more.
# Installation
Step 1: Download the Module
Clone or download the repository containing the MonitoringTool module.
# Step 2: Locate Your PowerShell Module Path
Open PowerShell and run the following command to view your module paths:
$env:PSModulePath -split ';'
This command will output a list of directories. Copy the MonitoringTool folder to the first directory in the list.
# Step 3: Import the Module
Open PowerShell and import the module by running:
Import-Module MonitoringTool
If you encounter any errors, double-check that the module is correctly placed in the PowerShell module path.
# Usage
Once the module is imported, you can use the provided cmdlets to monitor your machines. Below are some examples of how to use the module:

Monitor a single machine:
Get-MachinePerformance -ComputerName "MachineName"

Check event logs for warnings and errors:
Get-MachineEventLogs -ComputerName "MachineName" -LogType "System"

Monitor multiple machines in bulk:
Get-MachinePerformance -ComputerName @("Machine1", "Machine2", "Machine3")

Test which endpoint is online:
Test-ComputerOnline will prompt you to enter the name of the machine, or some characters and test and show all found machines.
The output will show online machines with the current user logged on, or not and offline machines.

Get-userLogged:
After you type the name of the machine you are looking for it will list the 10 last domains/users logged on the machine.

# Contributing
This project is still in its early stages, and I welcome contributions! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.
# Contact
If you have any questions or need further assistance, please feel free to contact me.


This
This is just an test for my GitHub API Module Wrapper that I am doing using PowerShell. #Thank You.
# New Line
o
This is a test
This is another test
This is another test
Test
TESTT
Test again
Testing
ads