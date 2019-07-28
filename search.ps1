$env:ChangedNuspec

$changes = Get-ChildItem $env:Build_SourcesDirectory -Recurse -Filter '*.nuspec' | Where-Object { $_.BaseName -eq $env:ChangedNuspec }

$changes

$nuspecLocation =  ($changes | ? { $_.Extension -eq '.nuspec' -and $_.Directory}).DirectoryName
$filter =  gci -Path $nuspecLocation -Filter '*.nuspec' | Select-Object FullName, BaseName,Name

$nuspec = $filter.Fullname
echo "Nuspec path: $nuspec"

$packageName = $filter.Basename
echo "Package name: $packageName"

$NuspecFile = $filter.Name
echo $artifact


echo "##vso[task.setvariable variable=NuspecDirectory$nuspecLocation"
echo "##vso[task.setvariable variable=Nuspec]$nuspec"
echo "##vso[task.setvariable variable=NuspecFile]$NuspecFile"
