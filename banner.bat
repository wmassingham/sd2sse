@echo off

for %%x in (%*) do (
	echo bat %%x
	powershell .\banner.ps1 -infile %%x
	@REM bash banner.sh "%%x"
)

@REM pause
