@echo off
title setting up folder locations...
echo setting up folder locations...

set main_folder=%localappdata%\DSD_LLP\
set downloads=!main_folder!Downloads\
set downloader=!main_folder!Downloaders\

if not exist "%main_folder%" mkdir "%main_folder%"
if not exist "%downloads%" mkdir "%downloads%"
if not exist "%downloader%" mkdir "%downloader%"

title setting up main files...
echo setting up main files...

if not exist "!downloader!ert_downloader.py" call :install "ert_downloader.py" "%downloader%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/ert_downloader.py"
if not exist "!downloader!ert2_downloader.py" call :install "ert2_downloader.py" "%downloader%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/ert2_downloader.py"
if not exist "!downloader!ert3_downloader.py" call :install "ert3_downloader.py" "%downloader%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/ert3_downloader.py"
if not exist "!main_folder!menu.bat" call :install "menu.bat" "%main_folder%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/menu.bat"
if not exist "!main_folder!main.py" call :install "main.py" "%main_folder%" "https://raw.githubusercontent.com/thompog/dsd_LLP/refs/heads/main/main.py"
if not exist "%userprofile%\settings.txt" (
    cd /d "%userprofile%"
    echo %downloads%>settings.txt
)
goto end

:install
set file=%0
set location=%1
set url=%2
echo downloading %file%...
curl -L %url% -o !location!!file!
echo done with installing %file%
exit /b

:end
cls
echo done with set up!
echo do you want to start the menu file?
set /p E=">> "
if "%E%"=="Y" (
    cd /d "%main_folder%"
    echo main>d.txt
    !main_folder!menu.bat
)
if "%E%"=="y" (
    cd /d "%main_folder%"
    echo main>d.txt
    !main_folder!menu.bat
)
if "%E%"=="Yes" (
    cd /d "%main_folder%"
    echo main>d.txt
    !main_folder!menu.bat
)
if "%E%"=="yes" (
    cd /d "%main_folder%"
    echo main>d.txt
    !main_folder!menu.bat
)
if "%E%"=="Ye" (
    cd /d "%main_folder%"
    echo main>d.txt
    !main_folder!menu.bat
)
if "%E%"=="ye" (
    cd /d "%main_folder%"
    echo main>d.txt
    !main_folder!menu.bat
)
if "%E%"=="n" exit
if "%E%"=="no" exit
if "%E%"=="N" exit
if "%E%"=="NO" (
    exit
) else (
    goto end
)
