#Persistent
SetTimer, CheckBluetoothKeyboard, 1000 ; Check every 5 seconds

CheckBluetoothKeyboard:
    if (IsBluetoothKeyboardConnected() && !IsDisplayExtended()) {
        Run, % "cmd /c start /min cmd /c ""DisplaySwitch.exe /extend""", , Hide
    }
return

IsBluetoothKeyboardConnected() {
    ; Replace "YourKeyboardName" with the name of your Bluetooth keyboard
    RunWait, % "cmd /c ""powershell -Command ""Get-PnpDevice -FriendlyName 'MX Keys' -Status OK | Out-Null; if ($?) {exit 1} else {exit 0}""""", , Hide UseErrorLevel
    return (ErrorLevel = 1) ; Returns true if the keyboard is connected
}

IsDisplayExtended() {
    RunWait, % "cmd /c ""powershell -Command ""$screens = [System.Windows.Forms.Screen]::AllScreens; if ($screens.Count -gt 1) {exit 1} else {exit 0}""""", , Hide UseErrorLevel
    return (ErrorLevel = 1) ; Returns true if there are multiple displays (assuming extended mode)
}
