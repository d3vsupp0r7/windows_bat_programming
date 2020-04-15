@echo on
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
	
	echo OUT: %dst_out%
	SET file_full_path=%src%%%f
	echo FULL PATH: !file_full_path!
	
	SET result=%src%%%f
	 echo %result%
	
	FOR %%i IN ("%src%%%f") DO (
		ECHO filedrive=%%~di
		ECHO filepath=%%~pi
		ECHO filename=%%~ni
		set "filename_out=%%~ni"
		set "filename_out_ext=%%~ni%%~xi"
		ECHO fileextension=%%~xi
	)
	
	echo filname: !filename_out!
	@copy /y "!file_full_path!" "!dst_out!\!filename_out_ext!" 
	  
)