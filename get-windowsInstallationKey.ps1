## retrieve the Windows Product Key from any PC
## by Jakob Bindslet (*** Email address is removed for privacy ***)

# Modified to target local machine and simplify output by Ken Hoover

$hklm = 2147483650
$regPath = "Software\Microsoft\Windows NT\CurrentVersion"
$regValue = "DigitalProductId"

$productKey = $null
$win32os = $null
$wmi = [WMIClass]"\\$env:computername\root\default:stdRegProv"
$data = $wmi.GetBinaryValue($hklm,$regPath,$regValue)
$binArray = ($data.uValue)[52..66]
$charsArray = "B","C","D","F","G","H","J","K","M","P","Q","R","T","V","W","X","Y","2","3","4","6","7","8","9"

## un-obfuscate XOR-encoded base24 binary data
For ($i = 24; $i -ge 0; $i--) {
    $k = 0
    For ($j = 14; $j -ge 0; $j--) {
        $k = $k * 256 -bxor $binArray[$j]
        $binArray[$j] = [math]::truncate($k / 24)
        $k = $k % 24
    }
    $productKey = $charsArray[$k] + $productKey
    If (($i % 5 -eq 0) -and ($i -ne 0)) {
    $productKey = "-" + $productKey
    }   
}
$win32os = Get-WmiObject Win32_OperatingSystem -computer $env:computername

$obj = New-Object Object

$obj | Add-Member Noteproperty Computer -value $env:computername
$obj | Add-Member Noteproperty ProductKey -value $productkey
$obj | Add-Member Noteproperty Caption -value $win32os.Caption

$obj

