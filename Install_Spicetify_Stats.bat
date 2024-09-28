@echo off

:: Download the zip file
echo Downloading from github
powershell -Command "iwr -useb 'https://github.com/harbassan/spicetify-apps/releases/download/stats-v1.1.1/spicetify-stats.release.zip' -OutFile 'spicetify-stats.release.zip'"

:: Extract the zip file to the CustomApps folder
powershell -Command "Expand-Archive -Path 'spicetify-stats.release.zip' -DestinationPath $env:appdata\spicetify\CustomApps -Force"

:: Delete the zip from downloads folder
DEL /F /Q "%USERPROFILE%\Downloads\spicetify-stats.release.zip"

:: make suke spicetify notices change
powershell -Command "spicetify config custom_apps stats"
powershell -Command "spicetify apply"

:: Notify user of completion
echo Download and extraction complete.
pause
