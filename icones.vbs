Set WshShell = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

batPath = FSO.BuildPath(FSO.GetParentFolderName(WScript.ScriptFullName), "Bureau.bat")

WshShell.Run "cmd.exe /c """ & batPath & """", 0, False