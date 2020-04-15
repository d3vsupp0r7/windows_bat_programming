@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET "src=C:\your\folder\as\source\copy\from\"
SET "dst=C:\your\folder\as\output\copied\files\"
set "dst_out=%cd%"
SET "file_list=.\files-to-copy.txt"
SET "out=.\result.log"
set "filename_out="
set "file_full_path="
set "filename_out_ext="
echo > %out%

FOR /F "usebackq eol=| delims=" %%f IN ("%file_list%") DO (
    rem just searching to find out existense of file
    WHERE /Q /R %src% "%%f"
	
	echo ** START **
	echo Destination folder output: %dst_out%
	
	SET file_full_path=%src%%%f
	echo Full path of file to copy: !file_full_path!
	
	SET result=%src%%%f
	 echo %result%
	
	FOR %%i IN ("%src%%%f") DO (
		rem ECHO filedrive=%%~di
		rem ECHO filepath=%%~pi
		rem ECHO filename=%%~ni
		set "filename_out=%%~ni"
		set "filename_out_ext=%%~ni%%~xi"
		rem ECHO fileextension=%%~xi
	)
	
	
	echo Processing file: !filename_out!
	@copy /y "!file_full_path!" "!dst_out!\!filename_out_ext!" 
	echo ** END ** 
)