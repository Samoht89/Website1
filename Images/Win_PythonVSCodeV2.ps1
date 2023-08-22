# Define the Python installation directory
$pythonInstallDir = "C:\Python311"  # Update this path based on your Python version and installation directory

# Installer nyeste Python

$pythonInstallerUrl = "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe"
$pythonInstallerPath = "$env:TEMP\python-installer.exe"
Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $pythonInstallerPath
Start-Process -Wait -FilePath $pythonInstallerPath -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1", "Include_test=0", "Include_pip=1", "Include_launcher=1"

# Add Python to the system PATH
$existingPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
$newPath = "$existingPath;$pythonInstallDir"
[System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)

# Refresh the environment to reflect the changes
$env:Path = $newPath

#Installere python tilegg
python.exe -m pip install --upgrade pip

pip3 install numpy ipykernel matplotlib ipycanvas

# Installer Visual Studio (du må endre URL-en til riktig versjon)
$vsInstallerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
$vsInstallerPath = "C:\Users\$env:USERNAME\Downloads\VSCodeUserSetup-x64-1.81.1.exe"
Invoke-WebRequest -Uri $vsInstallerUrl -OutFile $vsInstallerPath
Start-Process -Wait -FilePath $vsInstallerPath

# Åpne Visual Studio
Start-Process -Wait -FilePath "devenv"

# Nå kan du bruke den nyeste Python-versjonen og Visual Studio
