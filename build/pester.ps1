If(!(Get-Module Pester)){
    Install-Module -Name Pester -SkipPublisherCheck -Force
}

Import-Module Pester

. "/Get-ChocolateyPackageMetaData.ps1"

Invoke-Pester ../tests/package.tests.ps1

