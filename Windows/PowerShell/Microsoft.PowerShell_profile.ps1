Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-Alias -Name "cd" -Value z -Option AllScope

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Register-ArgumentCompleter -CommandName cd, Set-Location -ParameterName Path -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    [System.Management.Automation.CompletionCompleters]::CompleteFilename($wordToComplete) |
        ForEach-Object {
            $text = $_.CompletionText -replace '^(?:\./|\.\\)', ''
            $listText = $_.ListItemText -replace '^(?:\./|\.\\)', ''

            [System.Management.Automation.CompletionResult]::new(
                $text,
                $listText,
                $_.ResultType,
                $_.ToolTip
            )
        }
}

function prompt {
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
    
    $lastSuccess = $?
    
    if ($isAdmin) {
        if ($lastSuccess) {
            $arrowPrompt = "$([char]27)[1;31m$([char]27)[1;33m$([char]27)[1;31m $([char]27)[0m"
        } else {
            $arrowPrompt = "$([char]27)[1;31m $([char]27)[0m"
        }
    } else {
        if ($lastSuccess) {
            $arrowPrompt = "$([char]27)[1;31m$([char]27)[1;32m$([char]27)[1;33m $([char]27)[0m"
        } else {
            $arrowPrompt = "$([char]27)[1;31m $([char]27)[0m"
        }
    }
    
    $currentPath = Get-Location
    $homePath = $env:HOME ?? $env:USERPROFILE
    
    if ($currentPath.Path -eq $homePath) {
        $currentDir = "~"
    } else {
        $currentDir = Split-Path -Leaf $currentPath
        if ($currentDir -eq "") { $currentDir = "/" }
    }
    
    $dirPrompt = "$([char]27)[33m  $currentDir$([char]27)[0m"
    
    return $arrowPrompt + $dirPrompt + " "
}

function Refresh-Path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}
