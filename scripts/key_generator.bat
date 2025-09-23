@echo off
echo Starting the process...

cd "subscripts"

REM Run the second Python script
python gen_constants.py

REM Run the first Python script
python gen_keys.py

REM Run the third Python script
python gen_nonce.py

echo All scripts have finished.
echo This window will close in 3 seconds...
timeout /t 3 >nul
exit
