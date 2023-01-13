$connectTestResult = Test-NetConnection -ComputerName ccseyhanstestsa.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"ccseyhanstestsa.file.core.windows.net`" /user:`"localhost\ccseyhanstestsa`" /pass:`"oWEyZUTCpl0eEp/PhUX38t4bjflM09oUm9MoTxw8t6bDs536dtaCulnPFQULueVIpGwNNBo0CZuE+AStPq+oSg==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\ccseyhanstestsa.file.core.windows.net\filesharename" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}