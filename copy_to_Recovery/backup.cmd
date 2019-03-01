cls
@echo off
pushd %~dp0
dir refresh.wim
@echo.
echo MAKE A NEW RECOVERY IMAGE AND
echo DELETE THE OLD RECOVERY IMAGE?
echo.
echo.
set /P ANS=OK to continue (Y/N): 
if    "%ANS%"=="B" cmd
if /I "%ANS%"=="Y" goto :CONT
exit
:CONT
if exist refresh.wim del refresh.wim
if exist E:\os.tag set DRV=E:
if exist D:\os.tag set DRV=D:
if exist C:\os.tag set DRV=C:
Dism /Capture-Image /ImageFile:refresh.wim /CaptureDir:%DRV%\ /Name:"WINDOWS RESTORATION IMAGE" /compress:fast
wpeutil reboot
