
function Test-ComputerOnline {
try {
    # Prompting user to search for a machine on domain.
    $search = Read-Host "Enter the name/characters of the machine: "

    # Declaring server's name. 
    $ServerName = "Dida"

    # Searchig on Active Directory for computer objects
    $ComputerNames = Get-ADComputer -Filter "Name -like '*$search*'" | Where-Object { $_.Name -ne $ServerName } | Select-Object -ExpandProperty Name

    # Variable that will store computer objects.
    $jobs = @()

    # Below is performed a parallel execution to ping all computers at the same time, this will make the process run faster.
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
    # Get credentials of a user with admin access, you can store credentials on a file but for security reasons, I am not storing those.
    $credentials = Get-Credential

    # Checking if computers are online or no
    foreach ($result in $results) {
        if ($result.Online) {
        $PCName = $($result.ComputerName)
            Write-Output "$PCName is online"
    # The line below will use admin credentials and will show which user is logged on to online computers
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

    # Any other error will be throwing this message
    } catch { Write-Host "Unexpected error, please try again later" -ForegroundColor Red }
}
