Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

batPath = FSO.BuildPath(FSO.GetParentFolderName(WScript.ScriptFullName), "fond d'ecrand.bat")

WshShell.Run "cmd.exe /c """ & batPath & """", 0, False