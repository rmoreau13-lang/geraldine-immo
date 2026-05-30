@echo off
chcp 65001 >nul
REM ============================================================
REM  Publication de la selection Geraldine sur GitHub Pages
REM ------------------------------------------------------------
REM  AVANT de lancer ce script :
REM   1) Sur github.com (connecte), cree un depot PUBLIC,
REM      par exemple : geraldine-immo
REM   2) Remplace TON-PSEUDO ci-dessous par ton pseudo GitHub
REM   3) Place ce .bat dans le MEME dossier que le fichier HTML
REM      (ideal : C:\Users\Lenovo\Desktop\Work)
REM   4) Double-clique sur ce script
REM  Git doit etre installe (ou GitHub Desktop, qui l'installe).
REM ============================================================

set PSEUDO=rmoreau13-lang
set DEPOT=geraldine-immo
set SRC=Selection_appartements_Geraldine.html

set REMOTE=https://github.com/%PSEUDO%/%DEPOT%.git

cd /d "%~dp0"
if not exist "%SRC%" (
  echo.
  echo  [ERREUR] %SRC% introuvable dans ce dossier.
  echo  Place ce .bat a cote du fichier HTML, puis relance.
  echo.
  pause & exit /b 1
)

REM index.html = page d'accueil (URL racine propre)
copy /Y "%SRC%" index.html >nul

if not exist ".git" git init
git add index.html "%SRC%"
git commit -m "MAJ selection Geraldine %date% %time%"
git branch -M main
git remote remove origin 2>nul
git remote add origin %REMOTE%
git push -u origin main

echo.
echo ============================================================
echo  Pousse termine.
echo  Active ensuite GitHub Pages (une seule fois) :
echo    Settings  ^>  Pages  ^>  Branch: main  /root  ^>  Save
echo.
echo  Ton lien public sera :
echo    https://%PSEUDO%.github.io/%DEPOT%/
echo ============================================================
echo.
pause
