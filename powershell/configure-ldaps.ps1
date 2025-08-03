# configure-ldaps.ps1
# Enable LDAPS on Domain Controller (CipherNox.local)
# Run as Administrator

Write-Host "`n[+] Configuring LDAPS on this Domain Controller..."

# Step 1: Import Certificate (assumes .PFX file already installed in cert store)
Write-Host "[*] Ensure your SSL certificate is imported into 'NTDS\Personal' store."

# Step 2: Bind certificate to LDAP (port 636) – done automatically when proper cert is in place

# Step 3: Set registry to allow simple bind without encryption (optional for test purposes)
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" `
                 -Name "LDAPServerIntegrity" -Value 0 -Type DWord
Write-Host "[+] Registry updated: LDAPServerIntegrity = 0"

# Step 4: Restart Active Directory Domain Services
Write-Host "[*] Restarting Active Directory Domain Services..."
Restart-Service ntds -Force

Write-Host "`n[✓] LDAPS configuration complete. Please verify using test script."
