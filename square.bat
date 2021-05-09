@echo off

for %%x in (%*) do (
	echo bat %%x
	powershell .\square.ps1 -infile %%x
)

@REM pause
