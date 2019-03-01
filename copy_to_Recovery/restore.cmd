cls
color 4f
@echo off
for %%I in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%I:\REFRESH.WIM set drive=%%I:
If NOT "%Drive%"=="" echo Found RECOVERY at %Drive%
IF "%Drive%"=="" (
echo ERROR - COULD NOT FIND RECOVERY IMAGE!
pause
pause
wpeutil reboot
)

pushd %~dp0
echo.
echo IF YOU PROCEED YOU WILL DELETE ALL OF YOUR PERSONAL FILES
echo AND ALL PERSONAL PROGRAMS AND SETTINGS IN WINDOWS
echo.
echo.
echo THIS WILL COMPLETELY RESTORE WINDOWS TO ITS ORIGNAL STATE?
echo.
echo.
echo.
set /P ANS=DESTROY ALL FILES AND RECOVER WINDOWS (Y/N) : 
REM Secret key to enable a backup to be taken - must be uppercase B
if "%ANS%"=="B" %DRIVE%\backup.cmd 
if /I "%ANS%"=="Y" goto :RST
wpeutil reboot

:RST

if exist E:\os.tag set DRV=E:
if exist D:\os.tag set DRV=D:
if exist C:\os.tag set DRV=C:

echo sel vol %DRV%> x:\dp.scr
echo format fs=ntfs label="WINDOWS" quick>> x:\dp.scr
echo lis vol>> x:\dp.scr
echo exit>> x:\dp.scr
diskpart /s x:\dp.scr
echo Applying the image - please wait...
DISM /Apply-Image /ImageFile:%DRIVE%\refresh.wim /ApplyDir:%DRV% /index:1 
wpeutil reboot




