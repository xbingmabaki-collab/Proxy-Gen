@echo off
:: Check if Python is installed
where python >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Python is already installed.
    python --version
    goto install_pip
)

echo Installing Python 3.10...

:: Download Python 3.10 installer
set "PYTHON_URL=https://www.python.org/ftp/python/3.10.17/python-3.10.17-amd64.exe"
set "PYTHON_INSTALLER=%TEMP%\python-3.10.17-amd64.exe"

echo Downloading Python 3.10 installer...
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %PYTHON_INSTALLER%"

echo Installing Python 3.10 silently...
%PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

:install_pip
echo Installing required Python packages...
python -m pip install --upgrade pip
python -m pip install colorama requests

echo Installation complete!
pause
