$BinariesZipPath = "https://3dtoolkitstorage.blob.core.windows.net/releases/14480-Streaming-Win32-Release.zip" 
$RelativePathToServerExe='\Win32-Release\SpinningCube\SpinningCube_Server_NoUI.exe'

$DestinationFolder = "C:\3Dtoolkit"
mkdir $DestinationFolder
$BinariesFolder = $DestinationFolder+'\binaries'+ (Get-Date -UFormat "%M%S")
$BinariesZip=$BinariesFolder+'.zip'
$PathToExecutable = $BinariesFolder+$RelativePathToServerExe

$client = new-object System.Net.WebClient
$client.DownloadFile($BinariesZipPath,$BinariesZip)

Add-Type -A System.IO.Compression.FileSystem

[IO.Compression.ZipFile]::ExtractToDirectory($BinariesZip, $BinariesFolder)

cd (Split-Path -Path $PathToExecutable)

& ('.\'+(Split-Path -Path $PathToExecutable -Leaf))
