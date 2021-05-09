@echo off

for %%x in (%*) do (
	echo bat %%x
	powershell .\center.ps1 -infile %%x
)

@REM pause
