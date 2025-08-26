# Microsoft Bookings Page Creation Script

This PowerShell script automates the process of creating a **Microsoft Bookings shared booking page** and assigning **administrators** to manage it using the [Microsoft Graph PowerShell SDK](https://learn.microsoft.com/en-us/powershell/microsoftgraph/overview).

---

## 🚀 Features
- Connects to Microsoft Graph (beta endpoint).
- Creates a new **Bookings business page** with:
  - Display name (user-provided).
  - Email ID in the format `<BusinessName>@tenneteu.onmicrosoft.com`.
  - Default currency set to **EUR**.
- Adds **two administrators** to the newly created booking page.

---

## 🛠️ Prerequisites
1. **Permissions / Roles**
   - You must have **Exchange Administrator** or **Bookings Administrator** role in Microsoft Entra ID (Azure AD).
   - Graph API permissions:
     - `User.Read.All`
     - `Bookings.Manage.All`
     - `Bookings.Read.All`
     - `Bookings.ReadWrite.All`
     - `BookingsAppointment.ReadWrite.All`

2. **Installed Modules**
   - [Microsoft Graph PowerShell SDK](https://learn.microsoft.com/en-us/powershell/microsoftgraph/overview)  
     ```powershell
     Install-Module Microsoft.Graph -Scope CurrentUser
     ```

3. **PowerShell 5.1+ or PowerShell 7+**

---

## ▶️ Usage
1. Clone this repository or download the script.
2. Open **PowerShell** and run the script:
   ```powershell
   .\Create-BookingsPage.ps1
3. The script will:
  Ask for a Bookings Page name (avoid special characters).
  Generate the corresponding Bookings email address.
  Prompt you to enter the UPNs of two admins (e.g. user@domain.com).
  Create the bookings page and assign both admins.

## 📂 Files

script.ps1 → The main script.

README.md → Documentation.

