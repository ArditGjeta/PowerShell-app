$modulePublicPath = Join-Path $PSScriptRoot "Public"
$modulePrivatePath = Join-Path $PSScriptRoot "Private"

# Import functions from the Private folder (not exported)
Get-ChildItem -Path $modulePrivatePath -Filter "*.ps1" | ForEach-Object {
    # Dot source the file to import its functions
    . $_.FullName
}

# Import functions from the Public folder and export them
Get-ChildItem -Path $modulePublicPath -Filter "*.ps1" | ForEach-Object {
    # Dot source the file to import its functions
    . $_.FullName

    # The function name inside the .ps1 file should match the BaseName of the file
    $functionName = $_.BaseName
    Export-ModuleMember -Function $functionName
    }
