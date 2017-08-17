@echo off
ECHO %USERNAME% started the batch process at %TIME%  >output.txt


echo Drop and Re-Add DBs and Permissions >>output.txt

sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\ResetTables.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\SDS.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\ADS.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\Access.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\TestAccessProcs.sql>>output.txt



pause