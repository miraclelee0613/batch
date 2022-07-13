@echo off
chcp 65001>nul
setlocal ENABLEDELAYEDEXPANSION
set batchname=%~nx0
set listname=filelist
set /a listnum=0
set workercode=000
set classcode=00
set dscode=00
set setdate=220000
set fileExt=wav
rem ##########디렉터리 탐색##########
:OnDirectory
title 현재 디렉터리 경로 : %cd%
set /a dirnum=0
set /a dirlistnum=1
rem #####디렉터리 리스트 배열[1~N]#####
set dirlist=NULL
for /f %%i in ('dir /a:d /b') do set /a dirnum=dirnum+1
if %dirnum% lss 1 goto NoDir
for /f "tokens=*" %%i in ('dir /a:d /b') do (set dirlist[%dirlistnum%]=%%i & goto LoadDirList)
:LoadDirList
set /a dirlistnum=dirlistnum+1
rem #####리스트의 인덱스는 1부터 시작, 따라서 문장스킵은 리스트의 인덱스 - 1#####
set /a skips=dirlistnum-1
if %skips% equ %dirnum% goto EOF
for /f "tokens=* skip=%skips%" %%i in ('dir /a:d /b') do (set dirlist[%dirlistnum%]=%%i & goto LoadDirList)
goto quit
:EOF
echo 현재 경로 : %cd%
echo ----------------------------------------------------------------------
for /l %%i in (1,1,%dirnum%) do echo %%i. !dirlist[%%i]!
echo %dirlistnum%. [..]상위 디렉터리로 가기
echo ----------------------------------------------------------------------
echo 현재 경로의 디렉터리 수 : %dirnum%
echo 현재 경로를 작업공간으로 설정하기 : S
set /a dirnum=dirnum+1
set dirlist[%dirlistnum%]=..
set /p Todir=Choice : 
if %Todir% equ S goto quitExplore
if %Todir% equ s goto quitExplore
set /a temp=Todir-1
if %Todir% gtr %dirnum% (echo 1~%dirnum%까지만 선택 가능합니다. & pause>nul & cls & set /a dirnum=dirnum-1 & goto EOF)
if %temp% lss 0 (echo 1~%dirnum%까지만 선택 가능합니다. & pause>nul & cls & set /a dirnum=dirnum-1 & goto EOF)
goto MvDir
:NoDir
echo 현재 경로 : %cd%
echo ----------------------------------------------------------------------
echo %dirlistnum%. [..]상위 디렉터리로 가기
echo ----------------------------------------------------------------------
echo 현재 경로의 디렉터리 수 : %dirnum%
echo 현재 경로를 작업공간으로 설정하기 : S
set /a dirnum=dirnum+1
set dirlist[%dirlistnum%]=..
set /p Todir=Choice : 
if %Todir% equ S goto quitExplore
if %Todir% equ s goto quitExplore
set /a temp=Todir-1
if %temp% neq 0 (echo 현재 디렉터리에 디렉터리가 없습니다. & pause>nul & cls & set /a dirnum=dirnum-1 & goto EOF)
goto MvDir
:MvDir
cd !dirlist[%Todir%]!
cls
goto OnDirectory
:quitExplore
set /a skips=1
set /a number=1
cls & title 작업할 디렉터리 경로 : %cd%
rem ##########소리/소음 선택##########
echo ## 1. 소리 ##
echo ## 2. 소음 ##
set /p sn=대상 (ex: SS) : 
echo 파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
echo	---------	---------	---------	---------	---------
if %sn% equ SS goto SS
if %sn% equ 1 goto SS
if %sn% equ NN goto NN 
if %sn% equ 2 goto NN 

rem ##########소리 파일명설정##########
:SS
rem ##########소리상위코드 입력 (default:00)##########
echo [소리 : 00 고정]
echo ## 입력없이 엔터 입력 ##
set /p classcode=접두코드입력(ex: 00) : 
echo 	파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
rem ##########소리코드 입력 (default:00)##########
echo 소리 : 상위코드(SdCategory) 입력
set /p dscode=접미코드입력(ex: 00) : 
echo 	파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
rem #	워커코드 입력	#
set /p workercode=(소리)워커코드(ex: 700) : 
echo 	파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
goto ds

rem ##########소음 파일명설정##########
:NN
rem ##########소음 상위코드 입력 (default:00)##########
echo ##소음 : 소음원대분류(GUB_CLASS) 입력##
set /p classcode=접두코드입력(ex: 00) : 
echo 	파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
rem ##########소음 코드 입력 (default:00)##########
echo ##소음 : 하위코드 입력##
set /p dscode=접미코드입력(ex: 00) : 
echo 	파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
rem #	워커코드 입력	#
set /p workercode=(소음)워커코드(ex: 800) : 
echo 	파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
goto ds
:ds
echo	---------	---------	---------	---------	---------
rem #	날짜 입력		#
set /p setdate=날짜(ex:220628) : 
echo 	파일명 미리보기 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%]
rem ##########파일 확장자 입력##########
echo	## default : wav ##
echo 	## wav파일이면 입력없이 엔터 ##
set /p fileExt=파일 확장자(ex:xlsx, wav) : 
echo 	최종파일명 확인 : [%classcode%_%dscode%_%workercode%_%setdate%_001_%sn%.%fileExt%]
rem ##########선택 옵션##########
choice /c 12 /n /m "1.이름재설정, 2.파일복사 : "
if %errorlevel% equ 0 goto quit
if %errorlevel% equ 1 goto rename
if %errorlevel% equ 2 goto copyname
:rename
set option=rename
rem ##########파일 개수 계산(디렉터리  제외)##########
dir /b /a:-d > %listname%
for /f %%i in (%listname%) do set /a listnum=listnum+1
if %listnum% lss 2 (set option=renError & goto quit)
set /a plistnum=listnum-1
echo 현재 폴더의 파일 개수 : %plistnum%
rem ##########skip=0은 지원하지 않음, skip=1부터 시작##########
for /f "tokens=*" %%i in (%listname%) do (set temp=%%i & goto getName)
:renLoop
if %number% geq %listnum% goto quit
for /f "tokens=* skip=%skips%" %%i in (%listname%) do (set temp=%%i & set /a skips=skips+1 & goto getName)
:getName
if "%temp%" equ "%listname% " goto renLoop
rem ##########숫자 형식 설정 001~999 (010 != 8 error)##########
set Fixednumber=%number%
if %number% lss 100 set Fixednumber=0%number%
if %number% lss 10 set Fixednumber=00%number%
ren "%temp%" "%classcode%_%dscode%_%workercode%_%setdate%_%Fixednumber%_%sn%.%fileExt%"
set /a number=number+1
goto renLoop
:copyname
set option=copyname
dir /d
set /p target=복사할 파일 : 
set /p number=복사할 개수 : 
:cpLoop
if %number% lss 1 goto quit
set /a calcnumber=number
set Fixednumber=%calcnumber%
if %calcnumber% lss 100 set Fixednumber=0%calcnumber%
if %calcnumber% lss 10 set Fixednumber=00%calcnumber%
copy /y "%target%" "%classcode%_%dscode%_%workercode%_%setdate%_%Fixednumber%_SS.%fileExt%">nul
set /a number=number-1
goto cpLoop
:quit
if %option% equ rename (del /f %listname% & echo ########이름 재설정 완료!########)
if %option% equ renError (del /f %listname% & echo 이름을 재설정할 파일이 없습니다.)
if %option% equ copyname echo ########복사 완료!########
endlocal
pause>nul