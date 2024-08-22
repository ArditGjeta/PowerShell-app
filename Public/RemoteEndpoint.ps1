function RemoteEndpoint {
    param (
        [string]$computer,
        [string]$user
    )
    # Below are different test connections to determine if machines can communicate with each other.
    # Ping connection with the remote machine.
    if ($computer) {
        
        $pingResult = Test-NetConnection -ComputerName $computer
            if ($pingResult.PingSucceeded) {
            Write-Host "Connection successful, machine is on the same network" -ForegroundColor Cyan
            Start-Sleep -s 2
            Write-Host "Testing Port Connectivity" -ForegroundColor Cyan
        try {
            $PsResult = Test-WSMan -ComputerName $computer

            Write-Host " PowerShell Remoting is working between you and remote machine" -ForegroundColor Cyan
            Start-Sleep -s 2
            Write-Host "Please wait for a remote connection to be established"

            try {
            # After successfully passing the connection tests above, it's time to get remotely connected.
                $session = Enter-PSSession -ComputerName $computer -Credential $user
                Write-Host "PowerShell session Success" -ForegroundColor Green

            }
            catch {
                Write-Host "Remote Session not established, please try again later" -ForegroundColor Yellow
            }
            
            
        } catch {
            Write-Host "Remote SConnection needs your attention!
                    `n PowerShell remote test failed! You need to check/make a rule on the firewall for port 5985(HTTP) and 5986(HTTPS)" -ForegroundColor Red
                    Write-Host "`n Verify WinRM listener configuration on remote machine" -ForegroundColor Red
                    Write-Host "`n Look out for any anti-virus blocking any ports" -ForegroundColor Red
            
        }
            
            } else {
            # If the connection fails at pinging the remote machine, you need to check the IP of both machines
            Write-Host "Connection Failed! Please check if the remote machine is on the same network " -ForegroundColor Red
        }
    } 
    
    

}
