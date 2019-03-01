@echo off
for %%I in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%I:\restore.cmd set drive=%%I:
If NOT "%Drive%"=="" echo Found Restore.cmd at %Drive%
IF "%Drive%"=="" (
echo ERROR - COULD NOT FIND RESTORE.CMD!
pause
pause
wpeutil reboot
)
cls
%DRIVE%\RESTORE.CMD

