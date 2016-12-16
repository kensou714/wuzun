echo 清理svn信息是否继续
pause
for /r . %%a in (.) do rd /s /q "%%a\.svn"