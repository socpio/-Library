@echo off
color 0A
::�Թ���Ա��ʽ����
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c ""%~s0"" ::","","runas",1)(window.close)&&exit

:start
echo.
echo Copyright Jian Luo, IT, LZ_Saike
echo.
echo ���Թ���Ա��ʽ���б��ű�
echo.
echo.
choice /c yn /m "�Ƿ����Windows��ѯ����Ȥ��"
if errorlevel 2 goto on
if errorlevel 1 goto off

:off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
echo �ѳɹ��ر������� ��ѯ����Ȥ
pause & goto end

:on
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 1 /f
echo �ѳɹ����������� ��ѯ����Ȥ
pause & goto end

:end
taskkill /f /im explorer.exe & start explorer.exe