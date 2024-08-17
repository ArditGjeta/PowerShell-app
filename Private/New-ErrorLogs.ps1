function New-ErrorLogs {
    # A list with desired Windows logs
    $name = @('Application', 'Security', 'System')
    
    foreach ($log in $name) {
        # Get the logs for the current log name
        $moniTor = Get-EventLog -LogName $log -Newest 10 -EntryType Error, Warning -ErrorAction SilentlyContinue
        
        # Check if any logs were found
        if ($null -eq $moniTor -or $moniTor.Count -eq 0) {
            Write-Host "No matching entries found in $log log." -ForegroundColor Green
        } else {
            # Formating to show only Time Source and Messages
            $seperated = $moniTor | Format-Table -Property TimeGenerated, Source, Message
            # Display a message indicating which log is being shown
            Write-Host "These are $log logs :" -ForegroundColor Cyan
            # Output the logs to the console
            Write-Output $seperated
        }
        
        # Add a separator for readability
        Write-Host "`n--- End of $log logs ---`n" -ForegroundColor Yellow
    }
}
