try {
# Prompting the user to enter the name of the machine
$computer = Read-Host " Enter the name of the machine: "

# Getting Security logs with ID=4624 to see the last 10 users that have logged on to the machine
 $logs = Get-WinEvent -ComputerName $computer -FilterHashtable @{LogName='Security'; Id='4624'} -Credential (Get-Credential) -MaxEvents 10

# Function that will return Domain/Workgroup and user logged on to the machine
Function Get-userlogged {
    param (
       [Parameter(Mandatory=$true)]
        [string]$Message
       )

# Text manipulation to get the account name or domain with the space and the first object after space which is the name or domain 
$user = ($Message -split 'Account Name:\s+')[1] -split '\s' | Select-Object -First 1
$domain = ($Message -split 'Account Domain:\s+')[1] -split '\s' | Select-Object -First 1

        if (-not $user -or -not $domain) {
        return "Domain/User: Not Found"
    }

    
   return "Domain/User: $domain / $user"

}

foreach ($log in $logs) {

# Assign logs message (as a property) to a variable so we can use it as a parameter to our function
$message = $log.Message

# For our function to work we need to pull only the message
$userinfo = Get-userlogged -Message $message

# Converting log time to string so we can display it next to the logged user
$timelogged = $log.TimeCreated.ToString("dd-mm-yyyy HH:mm:ss")
Write-Output "$userinfo ->   Logged in: $timelogged"

    } catch { write-output 'Unexpected error, try again later'}
    
}





