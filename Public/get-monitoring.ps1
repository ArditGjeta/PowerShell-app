function get-monitoring {
    
    Write-Output "Below you will see CPU performance on 3 sequences"
    New-sysPerform

    Write-Output "Next command will show 10 newest logs of Application, Security and System"
    Write-Output "Note that to see security log you need to have administrator permissions"
    New-ErrorLogs
    
}
