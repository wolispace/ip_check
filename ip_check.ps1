# scan these IP addresses and report if we can ping each on a regular basis
#
# run with: powershell -ExecutionPolicy Bypass -File ip_check.ps1
# or simply run.bat :-)
#
$targetIPs = @{
    "192.168.1.100" = "Back 1 WiFi"
    "192.168.1.101" = "Driveway 2 WiFi"
    "192.168.1.102" = "Front 3 WiFi"
    "192.168.1.103" = "Side 4 LAN"
}

$intervalSeconds = 30
$logFile = "ip_check.csv"

while ($true) {
    foreach ($ip in $targetIPs.Keys) {
        $deviceName = $targetIPs[$ip]
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        try {
            Test-Connection -ComputerName $ip -Count 1 -ErrorAction Stop | Out-Null
            $logEntry = "$timestamp,$ip,OK  ,$deviceName"
        } catch {
            $logEntry = "$timestamp,$ip,FAIL,$deviceName"
        }

        # Display in console
        Write-Host $logEntry

        # Append to log file
        Add-Content -Path $logFile -Value $logEntry
    }
    Start-Sleep -Seconds $intervalSeconds
}