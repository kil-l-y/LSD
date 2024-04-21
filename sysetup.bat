@echo off
chcp 65001
mode con: cols=117 lines=26

timeout /t 10
echo MUST RUN AS ADMIN
timeout /t 10

set "key=HKEY_CURRENT_USER\Console"

mkdir "%userprofile%\Desktop\sysetup"
cd "%userprofile%\Desktop\sysetup"

reg add "%key%" /v FaceName /t REG_SZ /d "Consolas" /f
reg add "%key%" /v FontSize /t REG_DWORD /d 0xe /f

curl -L -O https://github.com/microsoft/terminal/releases/download/v1.18.3181.0/Microsoft.WindowsTerminal_1.18.3181.0_x64.zip
tar -xf Microsoft.WindowsTerminal_1.18.3181.0_x64.zip

curl -L -O https://github.com/valinet/Win11DisableRoundedCorners/releases/download/1.0.0.3/Win11DisableOrRestoreRoundedCorners.exe
start Win11DisableOrRestoreRoundedCorners.exe

reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f
taskkill /im explorer.exe /f
start /wait explorer.exe

curl -L -O https://github.com/valinet/ExplorerPatcher/releases/download/22621.2861.62.2_9b68cc0/ep_setup.exe
curl -L -O https://raw.githubusercontent.com/l-urk/Explorer-Patcher-Settings/main/ExplorerPatcher_22621.2861.62.2.reg
start ep_setup.exe

curl -L -O https://github.com/Open-Shell/Open-Shell-Menu/releases/download/v4.4.191/OpenShellSetup_4_4_191.exe
curl -L -O https://raw.githubusercontent.com/l-urk/my_openshell_settings/main/MenuSettings2024.xml
start /wait OpenShellSetup_4_4_191.exe

curl -L -O https://www.autohotkey.com/download/ahk-v2.exe
start /wait ahk-v2.exe

start dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
start dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all
start wsl --set-default-version 2
start wsl --install --distribution kali-linux

curl -L -O https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/PowerShell-7.4.1-win-x64.msi
start /wait PowerShell-7.4.1-win-x64.msi

curl -L -O https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.2/npp.8.6.2.Installer.x64.exe
start /wait npp.8.6.2.Installer.x64.exe

curl -L -O https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe
start /wait Git-2.43.0-64-bit.exe

curl -L -O https://www.7-zip.org/a/7z2404-x64.exe
start /wait 7z2404-x64.exe

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v Call /t REG_SZ /d "Shell Icons" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "3" /t REG_SZ /d "%HomeDrive%\Shell\s_foldericon.dll" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "3" /t REG_SZ /d "%HomeDrive%\Shell\s_foldericon.dll" /f
curl -L -o "%HomeDrive%\Shell\s_foldericon.dll" https://github.com/l-urk/Shell-Icons-307/raw/main/s_foldericon.dll

curl -L -O https://github.com/rainmeter/rainmeter/releases/download/v4.5.18.3727/Rainmeter-4.5.18.exe
start /wait Rainmeter-4.5.18.exe
curl -L -O  https://visualskins.com/media/p/16/rainy-days.rmskin
start /wait rainy-days.rmskin

curl -L -O https://github.com/l-urk/Shell_System/blob/main/Shell_System.zip
tar -xf Shell_System.zip
move Shell_System %HomeDrive%\Shell\System

copy "%HomeDrive%\Shell\System\shell.lnk" "%UserProfile%\Desktop\RUN_SHELL_SYSTEM.lnk"
copy "%HomeDrive%\Shell\System\exitall.lnk" "%UserProfile%\Desktop\EXIT_SHELL_SYSTEM.lnk"

curl -L -O https://aka.ms/dotnet-core-applaunch?missing_runtime=true&arch=x64&rid=win10-x64&apphost_version=7.0.12
start /wait dotnet-runtime-7.0.18-win-x64.exe

curl -L -O https://github.com/l-urk/SplitWin/releases/download/v1.1.1/SplitWinv1.1.1.zip
tar -xf SplitWinv1.1.1.zip
move SplitWin "%HomeDrive%\Shell\SplitWin"

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
%SystemRoot%\System32\rundll32.exe user32.dll,UpdatePerUserSystemParameters 1, True
taskkill /im explorer.exe /f
start explorer.exe


