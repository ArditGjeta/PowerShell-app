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
# Contributing
This project is still in its early stages, and I welcome contributions! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.
# Contact
If you have any questions or need further assistance, please feel free to contact me.

