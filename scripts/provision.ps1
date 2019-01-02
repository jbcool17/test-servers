
Write-Host 'Setting Admin Password'
# Set synchronized generated Administrator password
net user Administrator "test-test-test-123!"


Get-NetIpaddress | Where addressstate -EQ preferred

Write-Host 'starting....'
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"

Write-Host $env
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

Write-Host 'running scripts'

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file
