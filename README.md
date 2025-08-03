# 🛡️ Automated Active Directory Response to Unauthorized Access

## 🔧 Tools Used

- **Splunk** – Alert source for detecting unauthorized login attempts
- **Shuffle** – Open-source SOAR platform to automate workflow execution
- **Slack** – Receives alert messages and user action confirmations
- **Active Directory** – Target system for disabling compromised accounts (Windows Server 2025)

---

## 🧠 Project Overview

This project automates the incident response workflow triggered by unauthorized access attempts in a Windows domain environment.

### 🔄 Workflow Summary

1. **Splunk** detects a suspicious login (e.g., from an external IP)
2. An alert is sent to **Shuffle** via a webhook
3. Shuffle sends a message to a **Slack** channel to notify the SOC team
4. A **User Action** (approval prompt) is sent to SOC
5. If approved, Shuffle uses the **AD plugin** to disable the user
6. A final Slack message confirms the action

📸 See `workflow-diagrams/` and `screenshots/` folders for full visual context.

---

## 🚧 Known Limitation

The final AD disable action fails due to enforced LDAPS requirements on Windows Server 2025. This is a known limitation of Shuffle's current plugin, not a misconfiguration.

➕ [See full explanation here → `docs/limitations.md`](docs/limitations.md)

---

## 📁 Folder Structure

```bash
cyber-soc-ad-response/
├── powershell/           # PowerShell scripts for LDAPS testing and setup
├── workflow-diagrams/    # Architecture and workflow diagrams
├── screenshots/          # Screenshots of Slack messages, Splunk, error messages
├── docs/                 # Extra documentation (limitations, setup notes)
├── .gitignore            # Ignore sensitive files
└── README.md             # Project overview and usage
