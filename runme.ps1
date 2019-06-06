[string]$openCoverLocation = '.\packages\OpenCover.4.7.922\tools\'
[string]$login = 'f4012fd2a0f39b485968160853f74c0d903d4b33'
[string]$project = 'justelnegro_example-opencover'
[string]$organization = 'justelnegro-github'
[string]$url = 'https://sonarcloud.io'
[string]$coverageFolder = $pwd
[string]$targets = 'UnitTestProject1\bin\Debug\UnitTestProject1.dll'
[string]$branch = git branch


& dotnet sonarscanner begin /k:"$project" /o:"$organization" /d:sonar.host.url="$url" /d:sonar.login="$login" /d:sonar.cs.opencover.reportsPaths="$coverageFolder\opencover.xml"

MsBuild.exe /t:Rebuild

& $openCoverLocation\OpenCover.Console.exe -output:"$coverageFolder\opencover.xml" -register:user -target:"vstest.console.exe" -targetargs:"$targets"

& dotnet sonarscanner end /d:sonar.login="$login"
