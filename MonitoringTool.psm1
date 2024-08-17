$modulePublicPath = Join-Path $PSScriptRoot "Public"
$modulePrivatePath = Join-Path $PSScriptRoot "Private"

Get-ChildItem -Path $modulePrivatePath -Filter "*.ps1" | ForEach-Object {
    # Dot source the file to import its functions
    . $_.FullName
}

Get-ChildItem -Path $modulePublicPath -Filter "*.ps1" | ForEach-Object {
    # Dot source the file to import its functions
    . $_.FullName

    Export-ModuleMember -Function $_.BaseName

}