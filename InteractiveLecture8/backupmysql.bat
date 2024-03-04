@echo off

:: To run the batch file, run CMD as administrator, 
:: cd to the directory the file is in and enter
:: backupmysql.bat <type the user> <type the user password>
:: 7-Zip installed in default location is a dependency.

:: Use command line arguments as login and password.
set dbUser=%1
set dbPassword=%2

:: Create the backup directory if it does not exist.
if not exist "%userprofile%\desktop\backup" mkdir %userprofile%\desktop\backup
if not exist "%userprofile%\desktop\backup\mysql" mkdir %userprofile%\desktop\backup\mysql

:: Identify the directories that will be used.
set backupDir="%userprofile%\desktop\backup\mysql"
set mysqldump="C:\Program Files\MySQL\MySQL Workbench 8.0\mysqldump.exe"
set mysqlDataDir="C:\ProgramData\MySQL\MySQL Server 8.0\Data\"
set zip="C:\Program Files\7-Zip\7z.exe"

:: Get the date and time.
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
    set "YYYY=%dt:~0,4%"
    set "MM=%dt:~4,2%"
    set "DD=%dt:~6,2%"
    set "hh=%dt:~8,2%"
    set "min=%dt:~10,2%"

:: Identify the backup directory.
set dirName=%YYYY%%MM%%DD%_%hh%%min%

:: Create the backup directory.
if not exist %backupDir%\%dirName%\ mkdir %backupDir%\%dirName%


:: switch to the "data" folder.
pushd %mysqlDataDir%
:: iterate over the folder structure in the "data" folder to get the databases.
for /d %%f in (*) do (
    :: Save the databases to the backup directory.
    %mysqldump% --host="localhost" --user=%dbUser% --single-transaction --add-drop-table --databases --password=%dbPassword%  %%f > %backupDir%\%dirName%\%%f.sql
    :: Compress the backup files to gunzip files.
    %zip% a -tzip %backupDir%\%dirName%\%%f.sql.gz %backupDir%\%dirName%\%%f.sql
    del %backupDir%\%dirName%\%%f.sql
)

:: Return to the present working directory and pause to show output.
popd
pause
