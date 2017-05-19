Param(
  [string]$BinariesZipPath,
  [string]$RelativePathToServerExe
)

$DestinationFolder = "C:\3Dtoolkit"
$BinariesFolder = $DestinationFolder+'\binaries'+ (Get-Date -UFormat "%M%S")
$BinariesZip=$BinariesFolder+'.zip'
$PathToExecutable = $BinariesFolder+$RelativePathToServerExe

$client = new-object System.Net.WebClient
$client.DownloadFile($BinariesZipPath,$BinariesZip)

Add-Type -A System.IO.Compression.FileSystem

[IO.Compression.ZipFile]::ExtractToDirectory($BinariesZip, $BinariesFolder)

cd (Split-Path -Path $PathToExecutable)

& ('.\'+(Split-Path -Path $PathToExecutable -Leaf))
