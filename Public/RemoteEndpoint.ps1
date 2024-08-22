function RemoteEndpoint {
    param (
        [string]$computer,
        [string]$user
    )
    
    # Ping connection with remote machine
    if ($computer) {
        
        $pingResult = Test-NetConnection -ComputerName $computer
            if ($pingResult.PingSucceeded) {
            Write-Host "Connection Successfull, machine is on the same network" -ForegroundColor Cyan
            Start-Sleep -s 2
            Write-Host "Testing Port Connectivity" -ForegroundColor Cyan
        try {
            $PsResult = Test-WSMan -ComputerName $computer

            Write-Host " PowerShell Remoting is working between you and remote machine" -ForegroundColor Cyan
            Start-Sleep -s 2
            Write-Host "Please wait for remote connection to be establish"

            try {
                $session = Enter-PSSession -ComputerName $computer -Credential $user
                Write-Host "PowerShell session Success" -ForegroundColor Green

            }
            catch {
                Write-Host "Remote Session not establish, please try again later" -ForegroundColor Yellow
            }
            
            
        } catch {
            Write-Host "Remote SConnection needs your attention!
                    `n PowerShell remote test failed! You need to check/make a rule on firewall for port 5985(HTTP) and 5986(HTTPS)" -ForegroundColor Red
                    Write-Host "`n Verify WinRM listener configuration on remote machine" -ForegroundColor Red
                    Write-Host "`n Look out for any anti-virus blocking any ports" -ForegroundColor Red
            
        }
            # $PsResult = Test-WSMan -ComputerName $computer
                # if ($PsResult.StatusCode -eq 0) {
                #     Write-Host " PowerShell Remoting is working between you and remote machine" -ForegroundColor Cyan
                #     Start-Sleep -s 2
                #     Write-Host "Please wait for remote connection to be establish"
                #     $session = Enter-PSSession -ComputerName $computer -Credential $user
                #     if ($session.StatusCode -eq 0) {
                #         Write-Host "PowerShell session Success"
                #     } else {
                #         Write-Host "Remote Session not establish, please try again later" -ForegroundColor Yellow
                #     }
                # } else {
                #     Write-Host "Remote SConnection needs your attention!
                #     `n PowerShell remote test failed! You need to check/make a rule on firewall for port 5985(HTTP) and 5986(HTTPS)" -ForegroundColor Red
                #     Write-Host "`n Verify WinRM listener configuration on remote machine" -ForegroundColor Red
                #     Write-Host "`n Look out for any anti-virus blocking any ports" -ForegroundColor Red
                # }
            } else {
            Write-Host "Connection Failed! Please check if the remote machine is on the same network " -ForegroundColor Red
        }
    } 
    
    

}