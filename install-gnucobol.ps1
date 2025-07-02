# GnuCOBOL Installation Script for Windows
# This script helps install GnuCOBOL on Windows

Write-Host "GnuCOBOL Installation Helper" -ForegroundColor Green
Write-Host "==============================" -ForegroundColor Green

# Check if we're running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "This script should be run as Administrator for best results." -ForegroundColor Yellow
}

# Step 1: Install prerequisites using Chocolatey
Write-Host "`nStep 1: Installing prerequisites..." -ForegroundColor Blue

try {
    # Install MinGW for compilation
    Write-Host "Installing MinGW-w64..." -ForegroundColor Yellow
    choco install mingw -y
    
    # Install Git (useful for development)
    Write-Host "Installing Git..." -ForegroundColor Yellow
    choco install git -y
    
    Write-Host "Prerequisites installed successfully!" -ForegroundColor Green
} catch {
    Write-Host "Error installing prerequisites: $($_.Exception.Message)" -ForegroundColor Red
}

# Step 2: Download and install GnuCOBOL
Write-Host "`nStep 2: GnuCOBOL Installation Options" -ForegroundColor Blue
Write-Host "=======================================" -ForegroundColor Blue

Write-Host @"
Option 1: Manual Download (Recommended)
- Visit: https://sourceforge.net/projects/gnucobol/files/
- Download the latest Windows installer
- Run the installer as Administrator

Option 2: Compile from Source
- Download source from: https://sourceforge.net/projects/gnucobol/files/
- Extract and compile using MinGW

Option 3: Use MSYS2 (Alternative)
- Install MSYS2: https://www.msys2.org/
- Run: pacman -S mingw-w64-x86_64-gnucobol
"@ -ForegroundColor White

# Step 3: Test installation
Write-Host "`nStep 3: Testing Installation" -ForegroundColor Blue
Write-Host "============================" -ForegroundColor Blue

Write-Host @"
After installation, test with:
1. Open a new PowerShell window
2. Run: cobc --version
3. Try compiling a simple COBOL program

If cobc is not found, you may need to add it to your PATH.
"@ -ForegroundColor White

Write-Host "`nInstallation helper completed!" -ForegroundColor Green
