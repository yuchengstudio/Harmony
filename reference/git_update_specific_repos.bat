@echo off
echo This will update your HarmonyFramework to the latest server version.
echo Press Ctrl+C to abort, any key to continue.
pause > nul

:: List all repos to be updated
set repo_list=bsp csp core dev_packs net

for %%G in (%repo_list%) do (
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
