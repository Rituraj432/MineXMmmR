@echo off
cd /d "C:\xmrig"
:check_net
ping -n 1 1.1.1.1 >nul 2>&1
if %errorlevel% neq 0 (
timeout /t 5 >nul
goto check_net
)
xmrig.exe -a rx/0 -o sg.qrl.herominers.com:1166 -u Q0105007c8ae18fd268cc6b3e8e53dc237f69e75fd31018de375f568e93b85f1c345cb3f16685df -p pc1 --cpu-max-threads-hint 35 --cpu-priority 1 -k
