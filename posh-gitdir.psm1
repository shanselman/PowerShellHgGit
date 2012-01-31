. ([ScriptBlock]::Create("
function Get-ChildItem {
    $([Management.Automation.ProxyCommand]::GetCmdletBindingAttribute((Get-Command Get-ChildItem -CommandType Cmdlet)))
    param(
    $([Management.Automation.ProxyCommand]::GetParamBlock((Get-Command Get-ChildItem -CommandType Cmdlet)))
    )
    
    process {
        Microsoft.PowerShell.Management\Get-ChildItem @psBoundParameters |
            ForEach-Object {
                `$null = `$_.pstypenames.Insert(0, 'Dir-Git')
                `$_
            }
    }
}
"))
