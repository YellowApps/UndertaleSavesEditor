cls
Add-Type -AssemblyName System.Windows.Forms
Import-Module ".\loadForm.psm1" -DisableNameChecking

if(-not (Test-Path "$env:LOCALAPPDATA\UNDERTALE\file0")){
    [System.Windows.Forms.MessageBox]::Show("Не удается найти файл file0", "Ошибка", 0, 16)
}

Load-XAMLForm ".\MainWindow.xaml"

$file = Get-Content "$env:LOCALAPPDATA\UNDERTALE\file0"
$txtName.Text = $file[0].Trim()
$txtLevel.Text = $file[1].Trim()
$txtHP.Text = $file[2].Trim()
$txtATK.Text = $file[4].Trim()
$txtDEF.Text = $file[6].Trim()
$txtEXP.Text = $file[9].Trim()
$txtGold.Text = $file[10].Trim()
$txtRoom.Text = $file[547].Trim()

$btnSave.Add_Click({
    if(Test-Path "$env:LOCALAPPDATA\UNDERTALE\file0.old"){ del "$env:LOCALAPPDATA\UNDERTALE\file0.old" }
    copy "$env:LOCALAPPDATA\UNDERTALE\file0" "$env:LOCALAPPDATA\UNDERTALE\file0.old"

    $file[0] = $txtName.Text
    $file[1] = $txtLevel.Text
    $file[2] = $txtHP.Text
    $file[4] = $txtATK.Text
    $file[6] = $txtDEF.Text
    $file[9] = $txtEXP.Text
    $file[10] = $txtGold.Text
    $file[547] = $txtRoom.Text

    $file = $file -join "`n"
    Set-Content "$env:LOCALAPPDATA\UNDERTALE\file0" $file

    [System.Windows.Forms.MessageBox]::Show("Файл FILE0 сохранен.", "Редактор сохранений Undertale", 0, 64)
})

$form.ShowDialog() | Out-Null