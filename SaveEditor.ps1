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

$cmWeapon.SelectedIndex = 0;
$cmWeapon.ItemsSource = @("Оружие", "Палка#3", "Игрушечный нож#13", "Жёсткая перчатка#14", "Балетки#25", "Порванная тетрадь#45", "Подгоревшая сковорода#47", "Пустой пистолет#49", "Изношенный кинжал#51", "Настоящий нож#52")

$cmArmor.SelectedIndex = 0;
$cmArmor.ItemsSource = @("Броня", "Пластырь#4", "Выцветшая лента#12", "Мужская бандана#14", "Старая пачка#24", "Мутные очки#44", "Запачканный фартук#46", "Ковбойская шляпа#48", "Медальон в форме сердца#50", "Медальон#53", "Броня темми#64")

$items = @("", "Монстроконфета#1", "Крокет ролл (вырезано)#2", "Палка#3", "Пластырь#4", "Каменная конфета (вырезано)#5", "Тыквенные кольца (вырезано)#6", "Паучий пончик#7", "Твёрдый лук (вырезано)#8", "Призрачный фрукт (вырезано)#9", "Паучий сидр#10", "Ирисковый пирог#11", "Выцветшая лента#12", "Игрушечный нож#13", "Жёсткая перчатка#14", "Мужская бандана#15", "Кусок снеговика#16", "Доброженое#17", "Мороженое с тестом щенка (вырезано)#18", "Дваскимо#19", "Односкимо#20", "Коричный зайка#21", "Хлопья темми#22", "Брошенный киш#23", "Старая пачка#24", "Балетки#25", "Перфокарта#26", "Надоедливая собака#27", "Собачий салат#28", "Остатки собаки#29", "Остатки собаки#30", "Остатки собаки#31", "Остатки собаки#32", "Остатки собаки#33", "Остатки собаки#34", "Еда астронавтов#35", "Лапша Б.П.#36", "Крабовое яблоко#37", "Хот-дог...?#38", "Хот-кэт#39", "Гламбургер#40", "Морской чай#41", "Старфэ#42", "Легендарный герой#43", "Мутные очки#44", "Порванная тетрадь#45", "Запачканный фартук#46", "Подгоревшая сковорода#47", "Ковбойская шляпа#48", "Пустой пистолет#49", "Медальон в форме сердца#50", "Изношенный кинжал#51", "Настоящий нож#52", "Медальон#53", "Плохое воспоминание#54", "Последняя мечта#55", "Письмо Андайн#56", "Письмо Андайн EX#57", "Картофельные чипсы#58", "Вредная еда#59", "Таинственный ключ#60", "Стейк-лицо#61", "Тихий щенок#62", "Улиточный пирог#63", "Броня темми#64")

$it1 = $items.Clone()
$it1[0] = "Слот 1"
$cmSlot1.ItemsSource = $it1
$cmSlot1.SelectedIndex = 0

$it2 = $items.Clone()
$it2[0] = "Слот 2"
$cmSlot2.ItemsSource = $it2
$cmSlot2.SelectedIndex = 0

$it3 = $items.Clone()
$it3[0] = "Слот 3"
$cmSlot3.ItemsSource = $it3
$cmSlot3.SelectedIndex = 0

$it4 = $items.Clone()
$it4[0] = "Слот 4"
$cmSlot4.ItemsSource = $it4
$cmSlot4.SelectedIndex = 0

$it5 = $items.Clone()
$it5[0] = "Слот 5"
$cmSlot5.ItemsSource = $it5
$cmSlot5.SelectedIndex = 0

$it6 = $items.Clone()
$it6[0] = "Слот 6"
$cmSlot6.ItemsSource = $it6
$cmSlot6.SelectedIndex = 0

$it7 = $items.Clone()
$it7[0] = "Слот 7"
$cmSlot7.ItemsSource = $it7
$cmSlot7.SelectedIndex = 0

$it8 = $items.Clone()
$it8[0] = "Слот 8"
$cmSlot8.ItemsSource = $it8
$cmSlot8.SelectedIndex = 0

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

    if($cmWeapon.SelectedItem -ne "Оружие"){ $file[28] = $cmWeapon.SelectedItem.split("#")[1] }
    if($cmArmor.SelectedItem -ne "Броня"){ $file[29] = $cmArmor.SelectedItem.split("#")[1] }

    if($cmSlot1.SelectedItem -ne "Слот 1"){ $file[12] = $cmSlot1.SelectedItem.split("#")[1] }
    if($cmSlot2.SelectedItem -ne "Слот 2"){ $file[14] = $cmSlot2.SelectedItem.split("#")[1] }
    if($cmSlot3.SelectedItem -ne "Слот 3"){ $file[16] = $cmSlot3.SelectedItem.split("#")[1] }
    if($cmSlot4.SelectedItem -ne "Слот 4"){ $file[18] = $cmSlot4.SelectedItem.split("#")[1] }
    if($cmSlot5.SelectedItem -ne "Слот 5"){ $file[20] = $cmSlot5.SelectedItem.split("#")[1] }
    if($cmSlot6.SelectedItem -ne "Слот 6"){ $file[22] = $cmSlot6.SelectedItem.split("#")[1] }
    if($cmSlot7.SelectedItem -ne "Слот 7"){ $file[24] = $cmSlot7.SelectedItem.split("#")[1] }
    if($cmSlot8.SelectedItem -ne "Слот 8"){ $file[26] = $cmSlot8.SelectedItem.split("#")[1] }

    $file = $file -join "`n"
    Set-Content "$env:LOCALAPPDATA\UNDERTALE\file0" $file

    [System.Windows.Forms.MessageBox]::Show("Файл FILE0 сохранен.", "Редактор сохранений Undertale", 0, 64)
})

$form.ShowDialog() | Out-Null