Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias -Name "cd" -Value z -Option AllScope

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
