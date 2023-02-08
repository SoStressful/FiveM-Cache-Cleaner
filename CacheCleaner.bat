@echo off
cls
echo ^<----------------------^>
echo ^<  Nodus Cache Cleaner ^>
echo ^<----------------------^>
echo.
echo This script will delete the cache for either Discord or FiveM.
echo.
echo It will force close the processes "FiveM.exe", "GTAVLauncher.exe", or "Discord.exe" if they are running.
echo.

:menu
echo Select an option:
echo 1) Discord cache
echo 2) FiveM cache
echo 3) Both Discord and FiveM cache
echo.
choice /c 123 /m "Enter your selection (1, 2, or 3):"
if errorlevel 3 goto both
if errorlevel 2 goto fivem
if errorlevel 1 goto discord

:both
explorer "%APPDATA%\Discord"
rmdir /s /q "%APPDATA%\Discord\1.0.9008"
taskkill /f /im Discord.exe
taskkill /f /im FiveM.exe
taskkill /f /im GTAVLauncher.exe
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache-priv"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\logs"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\crashes"
cls
echo.
echo Delete the folder "1.0.9010" The number may be different depending on your version.
echo If you do not see the folder then it was deleted automaticly.
echo.
choice /c YN /m "Is the Folder Deleted (Y/N)?"
if errorlevel 2 goto menu
if errorlevel 1 goto showend

:discord
explorer "%APPDATA%\Discord"
rmdir /s /q "%APPDATA%\Discord\1.0.9010"
taskkill /f /im Discord.exe
cls
echo.
echo Delete the folder "1.0.9010" The number may be different depending on your version.
echo If you do not see the folder then it was deleted automaticly.
echo.
choice /c YN /m "Is the Folder Deleted (Y/N)?"
if errorlevel 2 goto menu
if errorlevel 1 goto showend
REM Insert code for deleting Discord cache here

:showend
cls
echo.
echo You may now close this window and connect to the server.
pause

goto end

:fivem
cls
echo Deleting FiveM cache...
taskkill /f /im FiveM.exe
taskkill /f /im GTAVLauncher.exe
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\data\server-cache-priv"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\logs"
rmdir /s /q "%LocalAppData%\FiveM\FiveM.app\crashes"
goto showend
