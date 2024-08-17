function New-sysPerform {
    $i = 0
while ($i -lt 3) {
    Get-CimInstance -ClassName Win32_PerfFormattedData_PerfOS_Processor | 
    Select-Object Name, PercentProcessorTime
    Start-Sleep -Seconds 5
    $i++
}

    
}