
; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "TexText for Inkscape"
!define PRODUCT_VERSION "0.5"
!define PRODUCT_PUBLISHER "Pit Garbe"
!define PRODUCT_WEB_SITE "http://www.et.tu-dresden.de"
!define PRODUCT_DIR_REGKEY "Software\Python\TexText"

!define PYTHONCORE "SOFTWARE\Python\PythonCore\2.6"

; MUI 1.67 compatible ------
!include "MUI2.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "TexText-0.5.exe"
InstallDir "$APPDATA\inkscape\extensions\"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show

Section -SETTINGS
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
SectionEnd

Section "TexText" -SEC01
  File "textext.py"
  File "asktext.py"
  File "textext.inx"
  WriteRegStr HKLM "${PYTHONCORE}\InstallPath\InstallGroup" "" "Python 2.6"
  WriteRegStr HKLM "${PYTHONCORE}\PythonPath" "" "$PROGRAMFILES\Inkscape\python\Lib;$PROGRAMFILES\Inkscape\python\DLLs;$PROGRAMFILES\Inkscape\python\Lib\site-packages"
SectionEnd

Section -Post
  WriteRegStr HKLM "${PYTHONCORE}\InstallPath" "" "$PROGRAMFILES\Inkscape\python"
SectionEnd