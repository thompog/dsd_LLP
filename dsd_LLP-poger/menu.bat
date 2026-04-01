@echo off
setlocal EnableExtensions
cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
  echo Python was not found in PATH.
  echo Install Python 3 and reopen this script.
  pause
  exit /b 1
)

if exist "%~dp0d.txt" (
  del "%~dp0d.txt" >nul 2>nul
  if exist "%~dp0main.py" python "%~dp0main.py"
)

:choice
cls
title DSD LLP Menu
echo 1. Download main.py
echo 2. Download needs.txt
echo 3. Download dnSpy zip
echo 4. Exit
set /p E=">> "

if "%E%"=="1" (
  if exist "%~dp0ert_downloader.py" (
    python "%~dp0ert_downloader.py"
  ) else if exist "%~dp0Downloaders\ert_downloader.py" (
    python "%~dp0Downloaders\ert_downloader.py"
  ) else (
    echo Could not find ert_downloader.py
  )
  pause
  goto choice
)

if "%E%"=="2" (
  if exist "%~dp0ert2_downloader.py" (
    python "%~dp0ert2_downloader.py"
  ) else if exist "%~dp0Downloaders\ert2_downloader.py" (
    python "%~dp0Downloaders\ert2_downloader.py"
  ) else (
    echo Could not find ert2_downloader.py
  )
  pause
  goto choice
)

if "%E%"=="3" (
  if exist "%~dp0ert3_downloader.py" (
    python "%~dp0ert3_downloader.py"
  ) else if exist "%~dp0Downloaders\ert3_downloader.py" (
    python "%~dp0Downloaders\ert3_downloader.py"
  ) else (
    echo Could not find ert3_downloader.py
  )
  pause
  goto choice
)

if "%E%"=="4" exit /b 0

echo That is not a valid choice.
timeout /t 2 >nul
goto choice
