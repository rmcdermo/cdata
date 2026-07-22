@echo off
set paper=CFAST_CData_Guide

git describe --long --dirty --always > gitinfo.txt
if errorlevel 1 if exist ..\..\cfast git -C ..\..\cfast describe --long --dirty --always > gitinfo.txt
if errorlevel 1 git -C ..\..\cfast-fork describe --long --dirty --always > gitinfo.txt
set /p gitrevision=<gitinfo.txt
if not exist ..\Bibliography mkdir ..\Bibliography
echo \newcommand^{\gitrevision^}^{%gitrevision%^} > ..\Bibliography\gitrevision.tex

pdflatex -interaction nonstopmode %paper% > %paper%.err
biber %paper% > %paper%.err
pdflatex -interaction nonstopmode %paper% > %paper%.err
pdflatex -interaction nonstopmode %paper% > %paper%.err

find "! LaTeX Error:" %paper%.err
find "Fatal error" %paper%.err
find "Error:" %paper%.err

if exist ..\Bibliography\gitrevision.tex erase ..\Bibliography\gitrevision.tex
echo %paper% build complete
