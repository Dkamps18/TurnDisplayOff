@echo off
setlocal enabledelayedexpansion

IF exist build/ (rmdir /s/q build)
mkdir build

for /f "delims=" %%x in (version) do set version=%%x

SET GOOS=windows
SET GOARCH=amd64
go build -o build/turndisplayoff.exe
tar -C build -a -cf build/turndisplayoff-%version%-Windows-%GOARCH%.zip turndisplayoff.exe
set idx=0
for /f %%F in ('certutil -hashfile build/turndisplayoff-%version%-Windows-%GOARCH%.zip SHA256') do (
    set "out!idx!=%%F"
    set /a idx += 1
)
echo turndisplayoff-%version%-Windows-%GOARCH%.zip   %out1% >> build/checksum.txt

del build\turndisplayoff.exe
