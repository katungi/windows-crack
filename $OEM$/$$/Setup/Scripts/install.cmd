@echo off
set ver=v5.2
title Windows 10 Digital Aktivasyon %ver% by mephistooo2 - TNCTR.com
mode con cols=70 lines=2
color 4e
echo YONETICI HAKLARI CAGIRILIYOR...

fltmc >nul 2>&1 || (
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdmin.vbs"
  echo UAC.ShellExecute "%~fs0", "", "", "runas", 2 >> "%temp%\GetAdmin.vbs"
  cmd /u /c type "%temp%\GetAdmin.vbs">"%temp%\GetAdminUnicode.vbs"
  cscript //nologo "%temp%\GetAdminUnicode.vbs"
  del /f /q "%temp%\GetAdmin.vbs" >nul 2>&1
  del /f /q "%temp%\GetAdminUnicode.vbs" >nul 2>&1
  exit
)
::============================================================================================================================================================
:MAINMENU
setlocal enabledelayedexpansion
setlocal EnableExtensions
pushd "%~dp0"
call :TITLE
::===============================================================================================================
set slp=SoftwareLicensingProduct
set sps=SoftwareLicensingService
FOR /F "tokens=3" %%I IN ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" ^| findstr CurrentVersion ^| findstr REG_SZ') DO (SET winver=%%I)
for /f "tokens=2* delims= " %%a in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "PROCESSOR_ARCHITECTURE"') do if "%%b"=="AMD64" (set vera=x64) else (set vera=x86)
for /f "tokens=2 delims== " %%A in ('"wmic path %slp% where (Name LIKE '%%Windows%%' and PartialProductKey is not null) get LicenseStatus /format:list"') do set status=%%A
for /f "tokens=2 delims=, " %%A in ('"wmic path %slp% where (Name LIKE '%%Windows%%' and LicenseStatus='%status%') get name /value"') do set osedition=%%A
::===============================================================================================================
if not exist "bin" md "bin"
set "gatherosstate=bin\%vera%\gatherosstate.exe"
set "slc=bin\%vera%\slc.dll"
::===============================================================================================================
:CheckWindows
set status=0
set spp=SoftwareLicensingProduct
wmic path %spp% where (Name LIKE '%%Windows%%') get LicenseStatus 2>nul | findstr "1" >nul && set status=1
if %status%==1 goto :Licensed
if %status%==0 goto :GenerateHWIDA
::===============================================================================================================
:Licensed
     echo.
     echo Windows 10 %osedition% %vera% zaten etkinlestirilmis.
     exit
::===============================================================================================================
:GenerateHWIDA
mode con cols=97 lines=57
cd /d "%~dp0"
cls
call :Header "WINDOWS 10 DIGITAL LISANS [Windows 10 %osedition% %vera%]"
echo:
if [%osedition%] == [Cloud] (
	set "edition=Cloud"
	set "key=V3WVW-N2PV2-CGWC3-34QGF-VMJ2C"
	set "sku=178"
	set "editionId=X21-32983"
	goto :parseAndPatch
)
if [%osedition%] == [CloudN] (
	set "edition=CloudN"
	set "key=NH9J3-68WK7-6FB93-4K3DF-DJ4F6"
	set "sku=179"
	set "editionId=X21-32987"
	goto :parseAndPatch
)
if [%osedition%] == [Core] (
	set "edition=Core"
	set "key=YTMG3-N6DKC-DKB77-7M9GH-8HVX7"
	set "sku=101"
	set "editionId=X19-98868"
	goto :parseAndPatch
)
if [%osedition%] == [CoreCountrySpecific] (
	set "edition=CoreCountrySpecific"
	set "key=N2434-X9D7W-8PF6X-8DV9T-8TYMD"
	set "sku=99"
	set "editionId=X19-99652"
	goto :parseAndPatch
)
if [%osedition%] == [CoreN] (
	set "edition=CoreN"
	set "key=4CPRK-NM3K3-X6XXQ-RXX86-WXCHW"
	set "sku=98"
	set "editionId=X19-98877"
	goto :parseAndPatch
)
if [%osedition%] == [CoreSingleLanguage] (
	set "edition=CoreSingleLanguage"
	set "key=BT79Q-G7N6G-PGBYW-4YWX6-6F4BT"
	set "sku=100"
	set "editionId=X19-99661"
	goto :parseAndPatch
)
if [%osedition%] == [Education] (
	set "edition=Education"
	set "key=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY"
	set "sku=121"
	set "editionId=X19-98886"
	goto :parseAndPatch
)
if [%osedition%] == [EducationN] (
	set "edition=EducationN"
	set "key=84NGF-MHBT6-FXBX8-QWJK7-DRR8H"
	set "sku=122"
	set "editionId=X19-98892"
	goto :parseAndPatch
)
if [%osedition%] == [Enterprise] (
	set "edition=Enterprise"
	set "key=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C"
	set "sku=4"
	set "editionId=X19-99683"
	goto :parseAndPatch
)
if [%osedition%] == [EnterpriseN] (
	set "edition=EnterpriseN"
  set "key=WGGHN-J84D6-QYCPR-T7PJ7-X766F"
	set "sku=27"
	set "editionId=X19-98746"
	goto :parseAndPatch
)
if [%osedition%] == [EnterpriseS] (
	set "edition=EnterpriseS"
	set "key=NK96Y-D9CD8-W44CQ-R8YTK-DYJWX"
	set "sku=125"
	set "editionId=X21-05035"
	goto :parseAndPatch
)
if [%osedition%] == [EnterpriseSN] (
	set "edition=EnterpriseSN"
	set "key=RW7WN-FMT44-KRGBK-G44WK-QV7YK"
	set "sku=126"
	set "editionId=X21-04921"
	goto :parseAndPatch
)
if [%osedition%] == [Professional] (
	set "edition=Professional"
	set "key=VK7JG-NPHTM-C97JM-9MPGT-3V66T"
	set "sku=48"
	set "editionId=X19-98841"
	goto :parseAndPatch
)
if [%osedition%] == [ProfessionalEducation] (
	set "edition=ProfessionalEducation"
	set "key=8PTT6-RNW4C-6V7J2-C2D3X-MHBPB"
	set "sku=164"
	set "editionId=X21-04955"
	goto :parseAndPatch
)
if [%osedition%] == [ProfessionalEducationN] (
	set "edition=ProfessionalEducationN"
	set "key=GJTYN-HDMQY-FRR76-HVGC7-QPF8P"
	set "sku=165"
	set "editionId=X21-04956"
	goto :parseAndPatch
)
if [%osedition%] == [ProfessionalN] (
	set "edition=ProfessionalN"
	set "key=2B87N-8KFHP-DKV6R-Y2C8J-PKCKT"
	set "sku=49"
	set "editionId=X19-98859"
	goto :parseAndPatch
)
if [%osedition%] == [ProfessionalWorkstation] (
	set "edition=ProfessionalWorkstation"
	set "key=DXG7C-N36C4-C4HTG-X4T3X-2YV77"
	set "sku=161"
	set "editionId=X21-43626"
	goto :parseAndPatch
)
if [%osedition%] == [ProfessionalWorkstationN] (
	set "edition=ProfessionalWorkstationN"
	set "key=WYPNQ-8C467-V2W6J-TX4WX-WT2RQ"
	set "sku=162"
	set "editionId=X21-43644"
	goto :parseAndPatch
)
if [%osedition%] == [ServerRdsh] (
	set "edition=ServerRdsh"
	set "key=NJCF7-PW8QT-3324D-688JX-2YV66"
	set "sku=175"
	set "editionId=X21-41295"
	goto :parseAndPatch
)
::===============================================================================================================
:parseAndPatch
cls
mode con cols=97 lines=15
call :Header "WINDOWS 10 DIGITAL LISANS [Windows 10 %osedition% %vera%]"
echo Dosyalar hazirlaniyor...
if not exist %gatherosstate% (
	call :Footer
	echo gatherosstate.exe dosyasi bulunamadi. Kopyalamak icin ISO surucu harfini girin.
	call :Footer
	set /p ogspath=Surucu harfini girin : ^>
	xcopy "!ogspath!:\sources\gatherosstate.exe" /s ".\bin" /Q /Y >nul 2>&1
)
set "ps=bin\
if [%osedition%] == [EnterpriseN] (
	set "ps=bin\entn.ps1"
	xcopy "!ps!" /s ".\bin" /Q /Y >nul 2>&1
	cd /d "bin"
	set "ps=entn.ps1"
	for /f "tokens=*" %%a in ('powershell -executionpolicy bypass -File !ps!') do set "key=%%a"
	if exist "!ps!" del /s /q "!ps!" >nul 2>&1
)
if [%osedition%] == [EnterpriseSN] (
	set "ps=bin\entsn.ps1"
	xcopy "!ps!" /s ".\bin" /Q /Y >nul 2>&1
	cd /d "bin"
	set "ps=entsn.ps1"
    for /f "tokens=*" %%a in ('powershell -executionpolicy bypass -File !ps!') do set "key=%%a"
	if exist "!ps!" del /s /q "!ps!" >nul 2>&1
)
pushd "%~dp0"
mode con cols=97 lines=46
call :Header "WINDOWS 10 DIGITAL LISANS [Windows 10 %osedition% %vera%]"
echo Kayit Defteri girdileri olusturuluyor...
reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d %sku% /f
reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d 1 /f
call :Footer
echo Windows 10 %edition% %vera% icin varsayilan urun anahtari yukleniyor...
echo:
cscript /nologo %windir%\system32\slmgr.vbs -ipk %key%
call :Footer
echo Windows 10 %edition% %vera% versiyonu icin donanim aktivasyonu olusturuluyor...
start /wait "" "%gatherosstate%"
timeout /t 3 >nul 2>&1
call :Footer
echo Windows 10 %edition% %vera% icin GenuineTicket.XML dosyasi yukleniyor...
echo:
clipup -v -o -altto bin\%vera%\
call :Footer
echo Windows 10 %edition% %vera% etkinlestiriliyor...
echo:
cscript /nologo %windir%\system32\slmgr.vbs -ato
call :Footer
echo Kayit Defteri girdileri siliniyor...
reg delete "HKLM\SYSTEM\Tokens" /f
call :Footer
del /f /q "%WinDir%\Setup\Scripts\bin\x86\*.*" >nul 2>&1
rmdir %WinDir%\Setup\Scripts\bin\x86\
del /f /q "%WinDir%\Setup\Scripts\bin\x64\*.*" >nul 2>&1
rmdir %WinDir%\Setup\Scripts\bin\x64\
del /f /q "%WinDir%\Setup\Scripts\bin\*.*" >nul 2>&1
rmdir %WinDir%\Setup\Scripts\bin\
del /f /q "%WinDir%\Setup\Scripts\*.*" >nul 2>&1
rmdir %WinDir%\Setup\Scripts\
exit
::===============================================================================================================
:Header
echo.
echo %~1
echo.
echo:
goto:eof
::===============================================================================================================
:Footer
echo:
echo.
echo:
goto:eof
::===============================================================================================================
:TITLE
title Windows 10 Digital Aktivasyon %ver% by mephistooo2 - TNCTR.com
goto:eof
::===============================================================================================================