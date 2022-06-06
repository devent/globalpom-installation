@REM
@REM Copyright 2011-2022 Erwin Müller <erwin.mueller@anrisoftware.com>
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM     http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM

set bashpath=%~dp0
set bashpath=%bashpath:~0,-1%
set apppath=%bashpath%/../..
set lib="%apppath%"\lib\*
set log="-Dlogback.configurationFile=file:///%apppath%/etc/logback-debug.xml"
set args=
set mainClass="${globalpom.custom.app.mainclass}"

java -version >nul 2>&1 && ( set found=true ) || ( set found=false )
if %found% EQU false (
    cscript "%apppath%/bin/windows/MessageBox.vbs" "Java is not correctly installed."
    exit 1
)

java %log% -cp %lib% %mainClass% %args% %*
