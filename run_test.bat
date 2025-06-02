@echo on
echo "🔁 Syncing with GitHub..."

:: Set GitHub repo and target folder
set REPO_URL=https://github.com/Sanjeev0066/jmeterTest.git
set LOCAL_DIR=C:\JMeterTests
set JMETER_HOME=C:\Users\sanje\Downloads\apache-jmeter-5.5\apache-jmeter-5.5
set REPORT_DIR=C:\jmeterOutput

:: Clone or pull latest repo
if exist %LOCAL_DIR% (
    cd /d %LOCAL_DIR%
    git pull
) else (
    git clone %REPO_URL% %LOCAL_DIR%
)

:: Clean output directory
echo "🧹 Deleting old output folder..."
rmdir /S /Q %REPORT_DIR%
mkdir %REPORT_DIR%

:: Run JMeter test
echo "🚀 Running JMeter test..."
%JMETER_HOME%\bin\jmeter.bat -n -t %LOCAL_DIR%\TestGoogleExample.jmx -l %REPORT_DIR%\results.jtl -e -o %REPORT_DIR%\report

echo "✅ Test complete. Report available at %REPORT_DIR%\report"
pause
