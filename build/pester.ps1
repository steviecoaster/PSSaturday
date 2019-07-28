If(!(Get-Module Pester)){
    Install-Module -Name Pester -SkipPublisherCheck -Force
}

Invoke-Pester ./tests/package.tests.ps1 -OutputFile "$($env:Build_ArtifactStagingDirectory)\$($env:Nuspec).xml" -OutputFormat 'NUnitXml'

