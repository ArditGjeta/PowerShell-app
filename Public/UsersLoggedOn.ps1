$logs = Get-WinEvent -ComputerName 'Server2' -FilterHashtable @{LogName='Security'; Id='4624'} -Credential (Get-Credential) -MaxEvents 10

Function Get-userlogged {
    param (
       [Parameter(Mandatory=$true)]
        [string]$Message
       )


$user = ($Message -split 'Account Name:\s+')[1] -split '\s' | Select-Object -First 1
$domain = ($Message -split 'Account Domain:\s+')[1] -split '\s' | Select-Object -First 1

        if (-not $user -or -not $domain) {
        return "Domain/User: Not Found"
    }

    
   return "Domain/User: $domain / $user"

}

foreach ($log in $logs) {

#Extract message
$message = $log.Message
$userinfo = Get-userlogged -Message $message
$timelogged = $log.TimeCreated.ToString("dd-mm-yyyy HH:mm:ss")
Write-Output "$userinfo ->   Logged in: $timelogged"
    
}



