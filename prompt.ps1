
$defaultPromptHash = "HEYStcKFSSj9jrfqnb9f+A=="

$md5 = [Security.Cryptography.MD5]::Create()
$thePrompt = [Text.Encoding]::Unicode.GetBytes((Get-Command prompt | Select-Object -ExpandProperty Definition))
$thePromptHash = [Convert]::ToBase64String($md5.ComputeHash($thePrompt))

if ($thePromptHash -eq $defaultPromptHash) #using the default prompt?
{
    #recommend our own
    function prompt(){
        # Reset color, which can be messed up by Enable-GitColors
        $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

        Write-Host($pwd) -nonewline -foregroundcolor white

        Write-VcsStatus 

        Write-Host ""
        return "$ "
    }
}
else {
    Write-Debug "Make sure your prompt includes a called to Write-VcsStatus!"    
}

