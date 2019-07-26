If(!(Get-Module Pester)){
    Install-Module -Name Pester -SkipPublisherCheck -Force
}

echo "I'm $env:Build.ArtifactStagingDirectory"
echo "I'm: $($Build.ArtifactStagingDirectory)"
echo "I'm: $env:Build_ArtifactStagingDirectory"

Invoke-Pester ./tests/package.tests.ps1 -OutputFile "$($env:Build.ArtifactStagingDirectory)\$($env:Package).xml" -OutputFormat 'NUnitXml'

