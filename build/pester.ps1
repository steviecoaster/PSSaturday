If(!(Get-Module Pester)){
    Install-Module -Name Pester -SkipPublisherCheck -Force
}

Invoke-Pester ./tests/package.tests.ps1

