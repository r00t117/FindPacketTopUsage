# Read the trace file
$content = Get-Content 'C:\Temp\morning-trace.txt'

# Extract IP addresses (private/internal only)
$ips = $content | Select-String '192\.168\.\d+\.\d+|10\.\d+\.\d+\.\d+|172\.(1[6-9]|2[0-9]|3[0-1])\.\d+\.\d+' -AllMatches | ForEach-Object { $_.Matches.Value }

# Count and sort
$grouped = $ips | Group-Object | Sort-Object Count -Descending | Select-Object -First 15

# Display results
Write-Host '==================================='
Write-Host 'TOP SOURCE IPs (Packet Count):'
Write-Host '==================================='
$grouped | ForEach-Object { 
    Write-Host ("{0,6} packets - {1}" -f $_.Count, $_.Name)
}
Write-Host ''
Write-Host 'The IP with the HIGHEST count is likely your culprit.'
Write-Host ''
