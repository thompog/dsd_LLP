@echo off
setlocal EnableExtensions
title DSD LLP Setup

echo Setting up folder locations...
set "main_folder=%LOCALAPPDATA%\DSD_LLP"
set "downloads=%main_folder%\Downloads"
set "downloader=%main_folder%\Downloaders"

if not exist "%main_folder%" mkdir "%main_folder%"
if not exist "%downloads%" mkdir "%downloads%"
if not exist "%downloader%" mkdir "%downloader%"

echo Setting up main files...
call :install "ert_downloader.py" "%downloader%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/ert_downloader.py"
call :install "ert2_downloader.py" "%downloader%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/ert2_downloader.py"
call :install "ert3_downloader.py" "%downloader%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/ert3_downloader.py"
call :install "menu.bat" "%main_folder%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/menu.bat"
call :install "main.py" "%main_folder%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/main.py"

>"%USERPROFILE%\settings.txt" echo %downloads%\

cls
echo Setup complete.
choice /C YN /M "Start the menu now"
if errorlevel 2 exit /b 0

cd /d "%main_folder%"
>d.txt echo main
call "%main_folder%\menu.bat"
exit /b 0

:install
set "file=%~1"
set "location=%~2"
set "url=%~3"
echo Downloading %file%...
curl -L "%url%" -o "%location%\%file%" >nul 2>nul
if errorlevel 1 (
  echo Failed to download %file%
) else (
  echo Installed %file%
)
exit /b 0
