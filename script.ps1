# Required Permissions, Exchange Admin
# Connect to Microsoft Graph
Select-MgProfile -Name beta
Connect-MgGraph -Scopes "User.Read.All", "Bookings.Manage.All", "Bookings.Read.All", "Bookings.ReadWrite.All", "BookingsAppointment.ReadWrite.All" | Out-Null

# Variables
$Role = "administrator" # Defines role for Bookings page staff member

# Prompt for the name of the shared bookings page
$BusinessName = Read-Host "Please enter the Name of the bookings page (no special characters)"
$BusinessIDName = $BusinessName.Replace(" ", "")
$BusinessID = "$BusinessIDName@tenneteu.onmicrosoft.com" # BusinessID is created based on name

# Prompt for admin UPNs
$Admin1 = Read-Host "Please enter UPN of Admin 1"
$entraAdmin1 = Get-MgUser -UserId $Admin1 # Get all user info for Admin 1
$Admin2 = Read-Host "Please enter UPN of Admin 2"
$entraAdmin2 = Get-MgUser -UserId $Admin2 # Get all user info for Admin 2

# Create the Shared Bookings page
Write-Host "Creating Shared Bookings page: $BusinessName"
$NewBookingsPage = New-MgBookingBusiness -DisplayName $BusinessName -DefaultCurrencyIso "EUR" -Email $BusinessID

# Wait for 1 minute
Start-Sleep -Seconds 60

# Add the Admins
# Add the Admins
New-MgBookingBusinessStaffMember -BookingBusinessId $NewBookingsPage.Id -BodyParameter @{
    "@odata.type" = "#microsoft.graph.bookingStaffMember"
    displayName = $entraAdmin1.DisplayName
    emailAddress = $entraAdmin1.Mail
    role = $Role
}


Write-Host "Adding $($entraAdmin2.DisplayName) as an admin to $BusinessName"
New-MgBookingBusinessStaffMember -BookingBusinessId $NewBookingsPage.Id -BodyParameter @{
    "@odata.type" = "#microsoft.graph.bookingStaffMember"
    displayName = $entraAdmin2.DisplayName
    emailAddress = $entraAdmin1.Mail
    role = $Role
}


Write-Host "Admins have been successfully added to the booking page."
