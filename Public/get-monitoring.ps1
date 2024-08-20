function get-monitoring {
    
       while ($true) {
    Write-Output "Below you will see CPU performance"
    $sequences = Read-Host -Prompt "Enter the number of sequences you want to see (Only Full Numbers): " 
    if ($sequences -match '\D') {
        Write-Output "Please use a character that is a digit, do not enter anything else!"
        
    } else {
        New-sysPerform -number $sequences
        break
    }

}

    Write-Output "Next command will show 10 newest logs of Application, Security and System"
    Write-Output "Note that to see the security log you need to have administrator permissions"
    New-ErrorLogs
    
}
