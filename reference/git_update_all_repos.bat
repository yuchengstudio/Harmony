@echo off
echo This will update your complete HarmonyFramework to the latest server version.
echo Press Ctrl+C to abort, any key to continue.
pause > nul

for /f "tokens=*" %%G in ('dir /b /A:D') do (
	echo.
	echo Updating [%%G]
	cd %%G
	git fetch
	git checkout .
	git checkout master
	git reset --hard origin/master
	git clean -fx
	git clean -fd
	git log -n 1 --oneline
	cd..
)
