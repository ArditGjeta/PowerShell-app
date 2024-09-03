
function Test-ComputerOnline {
try {
    $ServerName = "Dida"
    $ComputerNames = Get-ADComputer -Filter * | Where-Object { $_.Name -ne $ServerName } | Select-Object -ExpandProperty Name

    $jobs = @()
    
    foreach ($computer in $ComputerNames) {
        $jobs += Start-Job -ScriptBlock {
            param ($name)
            [PSCustomObject]@{
                ComputerName = $name
                Online = Test-Connection -ComputerName $name -Quiet
            }
        } -ArgumentList $computer
    }
    
    $results = $jobs | Wait-Job | Receive-Job
    
    $credentials = Get-Credential

    foreach ($result in $results) {
        if ($result.Online) {
        $PCName = $($result.ComputerName)
            Write-Output "$PCName is online"

            $user = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $PCName -Credential $credentials -Authentication PacketPrivacy -ErrorAction SilentlyContinue | Select-Object -ExpandProperty UserName
            if ($null -eq $user) {
            Write-Output "No user is logged on"
            }else{
            Write-Output " Current logon user: $user"
            }
        } else {
            Write-Output "$($result.ComputerName) is offline"
        }
    }
    
    $jobs | Remove-Job

    } catch { Write-Host "Unexpected error, please try again later" -ForegroundColor Red }
}