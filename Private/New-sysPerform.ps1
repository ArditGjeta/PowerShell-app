function New-sysPerform {
# Parameter to pass several how many sequences you want to see.
    param (
        [string]$number
    )
    $count = 0

# Gets CPU information in a human-readable format
    $totalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum
while($true) {
    $count++
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $cpuTime = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    $availMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
    $date + ' > CPU: ' + $cpuTime.ToString("#,0.000") + '%, Avail. Mem.: ' + $availMem.ToString("N0") + 'MB (' + (104857600 * $availMem / $totalRam).ToString("#,0.0") + '%)'
    Start-Sleep -s 2
    if ($count -eq $number) {
        break
        }
    }
}
