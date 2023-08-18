@echo off
color 0A
::以管理员方式运行
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit

:start
echo.
echo Copyright Jian Luo, IT, LZ_Saike
echo.
echo 请以管理员方式运行本脚本
echo.
echo.
choice /c yn /m "是否禁用Windows咨询和兴趣？"
if errorlevel 2 goto on
if errorlevel 1 goto off

:off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
echo 已成功关闭任务栏 咨询与兴趣
pause & goto end

:on
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 1 /f
echo 已成功开启任务栏 咨询与兴趣
pause & goto end

:end
taskkill /f /im explorer.exe & start explorer.exe