# test-connection.ps1
# Test if LDAPS (port 636) is reachable and working

$ldapServer = "yourdomaincontroller.domain.local"  # Replace with actual FQDN or IP

Write-Host "`n[+] Testing LDAPS connectivity to $ldapServer on port 636..."

Test-NetConnection -ComputerName $ldapServer -Port 636 | Format-List

# Optional: check if SSL cert is properly bound using LDAP over SSL
Write-Host "[*] If this fails, check firewall, certificate store, and AD DS service status."
