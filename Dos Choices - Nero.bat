@echo ===========
@echo == Created by Deon van Zyl
@echo == Date 1999
@echo == This file was created to allow for files in a certain directory (accessed as a virtual drive N) which relatest to the latest version of the software to be written on to a CD using Nero
@echo == Note: you will need Nero and to change paths if you want to use it
@echo == This also shows how input via choices can be taken and some error handling added
@echo ===========
@pause

Rem========================Setup Virtual Drive N:========================

REm Make a Directory called Current_version in drive c:
REM Run The following Line once from the Run Command (Start / Taskbar)

REM   subst n: "c:\Current_version"

REM=============================End of Drive Setup=======================




Rem===============================INFO===================================

Rem 1. You have to have Nero Installed in it`s Defualt path

Rem 2. The Drive N that is used here is a Subst Drive for the "Current_version" Directory.

Rem 3. Everything in the "Current_version" Directory will be written so everytime a new version is made the files in this Directory have to be replace.

Rem 4. If this batch file is run on a WIn 9X system it will asked if you want to create another cd copy at the end of each write.

Rem=============================End OF INFO==============================




Rem===========================Start THe Copy=============================

@cls
@ECHO off
ECHO...
ECHO....Press any key to abort.....
ECHO...
ECHO...............................


@cd "C:\Program Files\ahead\Nero"

@nerocmd --write --drivename d --real --tao --title Setup --iso Setup --close_session --create_iso_fs --image n:\*.*
@Pause
cls
ECHO................................................

Rem===============================End Copy=================================




Rem======================Multiple Copy Section (FOr Win9X)======================

ECHO................................................
Echo Create another copy ?
choice /c:yn /n Press Y or N!

if errorlevel 2 goto Complete
if errorlevel 1 goto More

:More

@nerocmd --write --drivename d --real --tao --title Setup --iso Setup --close_session --create_iso_fs --image n:\*.*
ECHO................................................
ECHO................................................
Echo Create another copy ?
choice /c:yn /n Press Y or N!

if errorlevel 2 goto Complete
if errorlevel 1 goto More

:Complete
Exit
