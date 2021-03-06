REM This bat script copies artifacts from 
REM XQilla, BDB XML, and Berkeley DB to a common tree.
REM Files include libraries, debug files (.pdb) and header files
REM This simplifies building as well as creation of a binary
REM release for Windows
REM 
REM In order to use only one script, it attempts to copy XQilla
REM and Xerces-C artifacts from *both* VC7.1 and VC8 directories
REM It takes a parameter of platform (Win32 vs Win64) to handle
REM which specific directory to copy.
REM
@ECHO OFF
SET XER_PLAT=Win32
SET ZLIB=zlib1.dll
IF /I %1 EQU x64 (
    Set ZLIB=zlibwapi.dll
    SET XER_PLAT=Win64
)

SET INSTALL=..\..
SET XERCES_BUILD=%INSTALL%\xerces-c-src\Build\%XER_PLAT%\VC7.1
SET XERCES_BUILD8=%INSTALL%\xerces-c-src\Build\%XER_PLAT%\VC8
SET XQILLA_BUILD=%INSTALL%\xqilla\build\windows\VC7.1\%1
SET XQILLA_BUILD8=%INSTALL%\xqilla\build\windows\VC8\%1
SET XML_BUILD=%INSTALL%\dbxml\build_windows\%1


SET LIB_DEST=%INSTALL%\lib
SET BIN_DEST=%INSTALL%\bin
SET JAR_DEST=%INSTALL%\jar
SET BIN_DEBUG_DEST=%INSTALL%\bin\debug

REM This line is for development builds where "dbxml" is "xml"
IF NOT EXIST %XML_BUILD% IF EXIST %INSTALL%\xml\build_windows SET XML_BUILD=%INSTALL%\xml\build_windows\%1

echo %XML_BUILD%

mkdir %LIB_DEST%
mkdir %BIN_DEST%
mkdir %BIN_DEBUG_DEST%
mkdir %JAR_DEST%

REM Copy Xerces libraries
XCOPY %XERCES_BUILD%\Release\*.lib %LIB_DEST% /I/Y/R
XCOPY %XERCES_BUILD%\Debug\*.lib %LIB_DEST% /I/Y/R
XCOPY %XERCES_BUILD8%\Release\*.lib %LIB_DEST% /I/Y/R
XCOPY %XERCES_BUILD8%\Debug\*.lib %LIB_DEST% /I/Y/R

REM Copy Xerces dlls
XCOPY %XERCES_BUILD%\Debug\*.dll %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XERCES_BUILD%\Debug\*pdb %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XERCES_BUILD%\Release\*.dll %BIN_DEST% /I/Y/R
XCOPY %XERCES_BUILD%\Release\*.pdb %BIN_DEST% /I/Y/R

XCOPY %XERCES_BUILD8%\Debug\*.dll %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XERCES_BUILD8%\Debug\*pdb %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XERCES_BUILD8%\Release\*.dll %BIN_DEST% /I/Y/R
XCOPY %XERCES_BUILD8%\Release\*.pdb %BIN_DEST% /I/Y/R

REM Copy XQilla libraries
XCOPY %XQILLA_BUILD%\Debug\*.lib %LIB_DEST% /I/Y/R
XCOPY %XQILLA_BUILD%\Release\*.lib %LIB_DEST% /I/Y/R

XCOPY %XQILLA_BUILD8%\Debug\*.lib %LIB_DEST% /I/Y/R
XCOPY %XQILLA_BUILD8%\Release\*.lib %LIB_DEST% /I/Y/R

REM Copy XQilla dlls and exe
XCOPY %XQILLA_BUILD%\Release\*.dll %BIN_DEST% /I/Y/R
XCOPY %XQILLA_BUILD%\Release\*.exe %BIN_DEST% /I/Y/R
XCOPY %XQILLA_BUILD%\Release\*.pdb %BIN_DEST% /I/Y/R
XCOPY %XQILLA_BUILD%\Debug\*.dll %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XQILLA_BUILD%\Debug\*.pdb %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XQILLA_BUILD%\Debug\*.exe %BIN_DEBUG_DEST% /I/Y/R

XCOPY %XQILLA_BUILD8%\Release\*.dll %BIN_DEST% /I/Y/R
XCOPY %XQILLA_BUILD8%\Release\*.exe %BIN_DEST% /I/Y/R
XCOPY %XQILLA_BUILD8%\Release\*.pdb %BIN_DEST% /I/Y/R
XCOPY %XQILLA_BUILD8%\Debug\*.dll %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XQILLA_BUILD8%\Debug\*.pdb %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XQILLA_BUILD8%\Debug\*.exe %BIN_DEBUG_DEST% /I/Y/R

REM Copy BDB XML libraries and jar
XCOPY %XML_BUILD%\Debug\*.lib %LIB_DEST% /I/Y/R
XCOPY %XML_BUILD%\Release\*.lib %LIB_DEST% /I/Y/R
XCOPY %XML_BUILD%\Debug\*.jar %JAR_DEST% /I/Y/R
XCOPY %XML_BUILD%\Release\*.jar %JAR_DEST% /I/Y/R

REM Copy BDB XML dlls and exe
XCOPY %XML_BUILD%\..\%ZLIB% %BIN_DEST% /I/Y/R
XCOPY %XML_BUILD%\..\%ZLIB% %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XML_BUILD%\Release\*.dll %BIN_DEST% /I/Y/R
XCOPY %XML_BUILD%\Release\*.exe %BIN_DEST% /I/Y/R
XCOPY %XML_BUILD%\Release\*.pdb %BIN_DEST% /I/Y/R
XCOPY %XML_BUILD%\Debug\*.dll %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XML_BUILD%\Debug\*.pdb %BIN_DEBUG_DEST% /I/Y/R
XCOPY %XML_BUILD%\Debug\*.exe %BIN_DEBUG_DEST% /I/Y/R

REM Copy headers
copyHeaders.bat

