@REM
@REM Copyright 2011-2016 Erwin Müller <erwin.mueller@deventm.org>
@REM
@REM This file is part of globalpom-izpack.
@REM
@REM globalpom-izpack is free software: you can redistribute it and/or modify it
@REM under the terms of the GNU Lesser General Public License as published by the
@REM Free Software Foundation, either version 3 of the License, or (at your
@REM option) any later version.
@REM
@REM globalpom-izpack is distributed in the hope that it will be useful, but
@REM WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
@REM FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
@REM details.
@REM
@REM You should have received a copy of the GNU Lesser General Public License
@REM along with globalpom-izpack. If not, see <http://www.gnu.org/licenses/>.
@REM

set bashpath=%~dp0
set bashpath=%bashpath:~0,-1%
set apppath=%bashpath%/../..
set lib="%apppath%"\lib\*
set log="-Dlogback.configurationFile=file:///%apppath%/etc/logback-debug.xml"
set args=
set mainClass="${project.custom.app.mainclass}"

java -version >nul 2>&1 && ( set found=true ) || ( set found=false )
if %found% EQU false (
    cscript "%apppath%/bin/windows/MessageBox.vbs" "Java is not correctly installed."
    exit 1
)

java %log% -cp %lib% %mainClass% %args% %*
