#############################################################################################
#
# MT5TimeLineWinClient.exe の自動起動スクリプト
#
#                                         2022/01/26
#                                         Retar.jp
#
#############################################################################################
#①実行ディレクトリを指定
$execDir = "C:\Program Files\MetaTrader 5"
#②実行プログラム
$execProgram = ".\terminal64.exe"
#③Wait Time
$waitTimeLong = 70
$waitTimeShort = 2
#④MT5のプログラム名
$execProcessMT5 ="terminal64"
#⑤MT5TimeLineWinClient.exeのプロセス名
$execProcessCLIENT ="MT5TimeLineWinClient"
#############################################################################################
#  
#  ***  重　要 ******  重　要 ******  重　要 ******  重　要 ******  重　要 ******  重　要 ***
#
#  Powershellが実行できないとき
#  PowerShellを起動して、セキュリティポリシーを変更します。 
#  
#  PS C:\WINDOWS\system32> Get-ExecutionPolicy
#  AllSigned
#  PS C:\WINDOWS\system32> Set-ExecutionPolicy RemoteSigned
#  実行ポリシーの変更
#  実行ポリシーは、信頼されていないスクリプトからの保護に役立ちます。実行ポリシーを変更すると、about_Execution_Policies
#  のヘルプ トピック (https://go.microsoft.com/fwlink/?LinkID=135170)
#  で説明されているセキュリティ上の危険にさらされる可能性があります。実行ポリシーを変更しますか?
#  [Y] はい(Y)  [A] すべて続行(A)  [N] いいえ(N)  [L] すべて無視(L)  [S] 中断(S)  [?] ヘルプ (既定値は "N"): y
#  PS C:\WINDOWS\system32> Get-ExecutionPolicy
#  RemoteSigned
#  
#  ***  重　要 ******  重　要 ******  重　要 ******  重　要 ******  重　要 ******  重　要 ***
#
#############################################################################################
cd $execDir
Start-Process $execProgram
#############################################################################################
#Sleep 70
Do {
    Start-Sleep -s $waitTimeLong
}
while ($condition -eq $true)
#############################################################################################
#Kill
Stop-Process -Name $execProcessMT5
Stop-Process -Name $execProcessCLIENT
#############################################################################################
#Sleep 2
Do {
    Start-Sleep -s $waitTimeShort
}
while ($condition -eq $true)
#############################################################################################
#MT5を実行
cd $execDir
Start-Process $execProgram
#############################################################################################
