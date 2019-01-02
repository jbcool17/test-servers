
Write-Host 'Setting Admin Password'
net user Administrator "test-test-test-123!"


Get-NetIpaddress | Where addressstate -EQ preferred

Write-Host 'Setting up ansible...'
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"

Write-Host $env
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file
