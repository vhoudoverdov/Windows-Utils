<# 
.SYNOPSIS 
    Wrapper for Get-ChildItem that provides a simplified interface for recursively searching a directory for filenames.
.Example 
    Find-File "C:\" "canary"
.Example
    Find-File "C:\" "Canary" -CaseSensitive
#>  

function Find-File 
{
[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=1)]
   [String]$Path,
   [Parameter(Mandatory=$True,Position=2)]
   [String]$Filename,
   [Switch]$CaseSensitive)

   if(!$(Test-Path $Path)){throw "The specified path wasn't found:  $Path"}

   Switch ($CaseSensitive){
        $True { 
                Get-ChildItem -Recurse $Path -ErrorAction SilentlyContinue | % {
                    if ($_.BaseName -cmatch $Filename){$_.FullName}}
              }
        $False{
                Get-ChildItem -Recurse $Path -ErrorAction SilentlyContinue | % {
                    if ($_.BaseName -match $Filename){$_.FullName}}
              }
                      }
}


<# 
.SYNOPSIS 
    Wrapper for Get-ChildItem that provides a simplified interface for recursively searching a path for files which contain a specified string.
.Example 
    Find-ContentPattern "C:\" "canary"
.Example
    Find-ContentPattern "C:\" "the quick brown fox" -CaseSensitive
#>
function Find-ContentPattern {
[CmdletBinding()]
Param(
   [Parameter(Mandatory=$True,Position=1)]
   [String]$Path,
   [Parameter(Mandatory=$True,Position=2)]
   [String]$Pattern,
   [Switch]$CaseSensitive)

   if(!$(Test-Path $Path)){throw "The specified path wasn't found:  $Path"}

   Switch ($CaseSensitive){
        $True {
                Get-ChildItem -Recurse $Path -ErrorAction SilentlyContinue | % {
                   if ( -not $_.psiscontainer -and (Select-String -Case $Pattern $_ -ea SilentlyContinue )) {$_} }
              }
        $False{
                Get-ChildItem -Recurse $Path -ErrorAction SilentlyContinue | % {
                   if ( -not $_.psiscontainer -and (Select-String $Pattern $_ -ea SilentlyContinue)) {$_} }
              }
                      }
} 
Export-ModuleMember *