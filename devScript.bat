@echo off
ECHO %USERNAME% started the batch process at %TIME%  >output.txt


echo Drop and Re-Add DBs and Permissions >>output.txt

sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\ResetTables.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\SDS.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\ADS.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\Access.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i TableScripts\TestAccessProcs.sql>>output.txt


echo Migrate Tables >>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i MigrationScripts\LoanApplicationMigration.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i MigrationScripts\CreditCheckMigration.sql>>output.txt



echo Create SPs >>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_InsTextTokenIfNotExists.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_InsLoanApplicationTokens.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_InsDateTokenIfNotExists.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_InsCreditCheckToken.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_InsComplexToken.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_GetTextValue.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_GetLoanApplicationBySSN.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_GetLoanApplicationByDOB.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_GetDateValue.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_GetComplexValue.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_InsLoanApplication.sql>>output.txt
sqlcmd.exe  -S 127.0.0.1 -E   -d  master  -i StoredProcedures\usp_InsCreditCheck.sql>>output.txt

pause