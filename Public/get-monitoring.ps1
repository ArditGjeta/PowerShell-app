function Get-Monitoring {
    try {
  while ($true) {
    Write-Output "Below you will see CPU performance"
    $sequences = Read-Host -Prompt "Enter the number of sequences you want to see (Only Full Numbers): " 

    # Validate the input to ensure it is a positive integer
    if ($sequences -match '\D') {
        Write-Output "Please enter a valid positive integer"
        
    } else {
        New-sysPerform -number $sequences
        break
    }

}
    # Pause to allow the user to read the messages
    Start-sleep -s 1
    
    # Making a new line so the user can detect the next sequences of running codes.
    Write-Output "`n Next command will show 10 newest logs of Application, Security and System"
    Start-sleep -s 1
    Write-Output "Note that to see the security log you need to have administrator permissions"
    Start-sleep -s 2
    New-ErrorLogs
    
}

    } catch {Write-Output "Unexpected error, try again later"}
