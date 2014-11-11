@REM
@REM Copyright 2011-2014 Erwin Müller <erwin.mueller@deventm.org>
@REM
@REM This file is part of globalpom-izpack-singlejar.
@REM
@REM globalpom-izpack-singlejar is free software: you can redistribute it and/or modify it
@REM under the terms of the GNU Lesser General Public License as published by the
@REM Free Software Foundation, either version 3 of the License, or (at your
@REM option) any later version.
@REM
@REM globalpom-izpack-singlejar is distributed in the hope that it will be useful, but
@REM WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
@REM FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
@REM details.
@REM
@REM You should have received a copy of the GNU Lesser General Public License
@REM along with globalpom-izpack-singlejar. If not, see <http://www.gnu.org/licenses/>.
@REM

set lib="%CD%"\lib\*
set log="-Dlogback.configurationFile=file:///%CD%/etc/logback.xml"
set args=
set mainClass="${project.custom.app.mainclass}"

javaw -version >nul 2>&1 && ( set found=true ) || ( set found=false )
if %found% EQU false (
    cscript bin/windows/MessageBox.vbs "Java is not correctly installed."
    exit 1
)

start javaw %log% -cp %lib% %mainClass% %args% %*
