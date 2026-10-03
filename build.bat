@echo off
setlocal

set CSC=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe
set KSP=C:\Program Files (x86)\Steam\steamapps\common\Kerbal Space Program
set MANAGED=%KSP%\KSP_x64_Data\Managed

if not exist "%CSC%" (
    echo ERROR: C# compiler not found.
    exit /b 1
)
if not exist "%MANAGED%\Assembly-CSharp.dll" (
    echo ERROR: KSP 1.12.x managed assemblies not found.
    exit /b 1
)

set REFS=/reference:"%MANAGED%\Assembly-CSharp.dll"
set REFS=%REFS% /reference:"%MANAGED%\Assembly-CSharp-firstpass.dll"
if exist "%MANAGED%\UnityEngine.dll" set REFS=%REFS% /reference:"%MANAGED%\UnityEngine.dll"
if exist "%MANAGED%\UnityEngine.CoreModule.dll" set REFS=%REFS% /reference:"%MANAGED%\UnityEngine.CoreModule.dll"
if exist "%MANAGED%\UnityEngine.PhysicsModule.dll" set REFS=%REFS% /reference:"%MANAGED%\UnityEngine.PhysicsModule.dll"
if exist "%MANAGED%\UnityEngine.UI.dll" set REFS=%REFS% /reference:"%MANAGED%\UnityEngine.UI.dll"
if exist "%MANAGED%\UnityEngine.IMGUIModule.dll" set REFS=%REFS% /reference:"%MANAGED%\UnityEngine.IMGUIModule.dll"

if not exist "Plugins" mkdir "Plugins"
"%CSC%" /nologo /target:library /optimize+ /langversion:5 ^
  /out:"Plugins\ManuverTrails.dll" %REFS% "Source\ManuverTrails.cs"
if errorlevel 1 exit /b 1

echo ManuverTrails built successfully against KSP 1.12.5.
exit /b 0
