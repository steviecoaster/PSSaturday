$changes = gci $pwd -Recurse -Include '*.nuspec' | Where-Object { $_.Name -eq $env:ChangedNuspec }
      
      If($changes.Count -gt 0) {
      $nuspecLocation =  ($changes | ? { $_.Extension -eq '.nuspec' -and $_.Directory}).DirectoryName
      $filter =  gci -Path $nuspecLocation -Filter '*.nuspec' | Select-Object FullName, BaseName,Name
      $nuspec = $filter.Fullname
      echo "Nuspec path: $nuspec"
      $packageName = $filter.Basename
      echo "Package name: $packageName"
      $artifact = $filter.Name
      echo $artifact
      echo "##vso[task.setvariable variable=NUSPECLOCATION]$nuspecLocation"
      echo "##vso[task.setvariable variable=NUSPECNAME]$nuspec"
      echo "##vso[task.setvariable variable=ArtifactName]$artifact"
      echo "##vso[task.setvariable variable=Package]$packageName"
      
      }
      
      else { 
      
      throw "No suitable changes detected to build chocolatey package"
      }