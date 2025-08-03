# 🚧 Known Limitation: LDAPS and Shuffle Integration

## ❗ Issue Summary

During the final step of the automated response workflow, Shuffle attempts to disable the compromised Active Directory user account. This operation fails due to the following error:


## 📌 Root Cause

This error originates from Windows Server 2025 enforcing secure LDAP (LDAPS) connections when using simple bind authentication. By default, Active Directory **rejects non-LDAPS bind attempts** when using credentials over port 389.

However, **Shuffle’s Active Directory plugin currently does not support LDAPS** with SSL/TLS certificates, which makes secure communication impossible in this case.

## 🛠️ Troubleshooting & Workarounds Attempted

Several attempts were made to resolve or bypass the issue:

- ✅ LDAPS was enabled and tested on port 636
- ✅ SSL certificate installed and bound to the LDAP service
- ✅ `LDAPServerIntegrity` registry key was adjusted:
  ```reg
  [HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Parameters]
  LDAPServerIntegrity = 0

## 🔐 Why This Matters

This issue is **not due to misconfiguration**, but rather a limitation in the current version of Shuffle’s AD plugin. Without SSL support, it's not possible to execute secure actions like disabling accounts in hardened AD environments.

## ✅ Final Decision

This limitation has been documented in this repository. The workflow is otherwise functional and complete.
