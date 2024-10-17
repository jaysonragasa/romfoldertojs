# Define the folder path you want to scan
$folderPath = "C:\path\to\your\folder"

# Define the output file path with .js extension
$outputFilePath = "C:\path\to\your\output.js"

# Get the contents of folders and files based on the new specification
function Get-FolderContents {
    param (
        [string]$Path
    )

    $childFolders = Get-ChildItem -Path $Path -Directory

    $contents = @()

    foreach ($childFolder in $childFolders) {
        $file = Get-ChildItem -Path $childFolder.FullName -File | Select-Object -First 1

        if ($file) {
            $contents += [pscustomobject]@{
                soupin = $childFolder.Name
                child  = $false
                title  = $childFolder.Name
                url    = "/mnt/card/game/$($Path -Leaf)/$($childFolder.Name)/$($file.Name)"
            }
        }
    }

    return $contents
}

# Get the folder contents and wrap in the "list" property
$folderContents = @{
    list = Get-FolderContents -Path $folderPath
}

# Convert to a compressed JSON format
$compressedJson = $folderContents | ConvertTo-Json -Depth 5 -Compress

# Save the output as a .js file with the JSON data
"const data = $compressedJson;" | Set-Content -Path $outputFilePath

Write-Host "JavaScript file generated at $outputFilePath"
