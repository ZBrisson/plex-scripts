#-----------------------------------------------------------------------------
# Script: getLibraryMetaData
# Author: Zach Brisson
# Date: 08/07/17
# Runs through all specificed libraries and retrieves all metadata.
# Then filters the metadata down to runtime, file size, total bitrates, and name.
# Uses the getFileMetaData by the scripting guy and will take a long time to complete.

# Searches subdirectories of the $fileDirectory
# E.G. C:\Videos will only scan subfolders(C:\Videos\folder\), file C:\Videos\movie.avi will not be scanned.
$fileDirectory = "C:\Users\<username>\Downloads\Videos"
$csvDirectory = "C:\Users\<username\Downloads\metadata.csv"

$videoMetadata = Get-FileMetaData -folder (Get-childitem $fileDirectory -Recurse -Directory).FullName
$videoMetadata |
    Select Name, Size, Length, 'Bit rate', Path |
    Export-Csv -Path $csvDirectory -NoTypeInformation
