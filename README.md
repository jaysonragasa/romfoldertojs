# ROM Folder to .js

This PowerShell script generates a JSON file representing the structure of folders and files within a specified directory. 
The output JSON is saved as a `.js` file, with the array of objects organized under a `list` property. Each object contains properties like `soupin`, `title`, `url`, and `child`.

## Prerequisites

Ensure you have:
- PowerShell installed on your system.
- Appropriate permissions to run PowerShell scripts and access the directories.

## Usage

1. Open PowerShell as Administrator.
2. Save the script as `romfoldertojs.ps1`.
3. Apply the necessary permission before running the script as well as the input and output path

## Necessary Permission

**Execution Policy**: If you encounter an error related to the execution policy (e.g., running scripts is disabled on this system), you may need to change the policy temporarily:
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
```

This allows you to run scripts for the current session without permanently changing system settings.

## Before running

Make some changes in the code 
```
# folderPath is where is your game ROM located, it can be in sfc, gb, or gba
$folderPath = "I:\game\gba"
```
then the output file and folder
```
# Define the output JSON file path
$outputJsonPath = "I:\game\.date\gba.js"
```

Then finally, run the script
```
.\romfoldertojs.ps1
```

A sample output would look like this

```json
{"list":[{"soupin":"Prince of Persia","child":false,"title":"Prince of Persia","url":"/mnt/card/game/gb/Prince of Persia/Prince of Persia.gb"}]}
```
