function New-ErrorLogs {
    # A list with desired Windows logs
    $name = @('Application', 'Security', 'System')
    
    foreach ($log in $name) {
        # Get Error and Warning logs for the current log name.
        $moniTor = Get-EventLog -LogName $log -Newest 10 -EntryType Error, Warning -ErrorAction SilentlyContinue
        
        # Check if any logs were found
        if ($null -eq $moniTor -or $moniTor.Count -eq 0) {
            Write-Host "No matching entries found in $log log." -ForegroundColor Green
        } else {
            
            # Display a message indicating which log is being shown
            Write-Host "These are $log logs:" -ForegroundColor Cyan

            # Format and display the logs with TimeGenerated, Source, and Message properties
            $monitor | Format-Table -Property TimeGenerated, Source, Message -AutoSize
        
            # Add a separator for readability
            Write-Host "`n--- End of $log logs ---`n" -ForegroundColor Yellow
        }
    }
}
