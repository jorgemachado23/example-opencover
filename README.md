# example-opencover

dotnet sonarscanner begin /k:"justelnegro_example-opencover" /d:sonar.organization="justelnegro-github" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="f4012fd2a0f39b485968160853f74c0d903d4b33" /d:sonar.cs.opencover.reportsPaths="%CD%\opencover.xml"
SonarScanner.MSBuild.exe begin /k:"justelnegro_example-opencover" /d:sonar.organization="justelnegro-github" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="f4012fd2a0f39b485968160853f74c0d903d4b33" /d:sonar.cs.opencover.reportsPaths="%CD%\opencover.xml"

MsBuild.exe /t:Rebuild

.\packages\OpenCover.4.7.922\tools\OpenCover.Console.exe -output:"%CD%\opencover.xml" -register:user -target:"vstest.console.exe" -targetargs:"UnitTestProject1\bin\Debug\UnitTestProject1.dll"

SonarScanner.MSBuild.exe end /d:sonar.login="f4012fd2a0f39b485968160853f74c0d903d4b33"


dotnet sonarscanner end /d:sonar.login="f4012fd2a0f39b485968160853f74c0d903d4b33"
