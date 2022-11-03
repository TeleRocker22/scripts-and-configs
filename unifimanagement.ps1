#Requires -RunAsAdministrator

$unifiinstallpath="$env:USERPROFILE\Ubiquiti UniFi\"

$unifidir="$env:USERPROFILE\Downloads\UniFi Installer\"

$unifilatest=Get-ChildItem -Path $unifidir *unifi*.exe | sort LastWriteTime -Descending | Select-Object -ExpandProperty Name | Select -First 1

$unifilatestinfo=(Get-Item $unifidir$unifilatest).VersionInfo | Select-Object -ExpandProperty FileVersion

$unificurrent= (Get-Item "$env:USERPROFILE\Ubiquiti UniFi\Uninstall.exe").VersionInfo | Select-Object -ExpandProperty FileVersion

function install-service
{
	java -jar $unifiinstallpath"lib\ace.jar" installsvc
}

function uninstall-service
{
	java -jar $unifiinstallpath"lib\ace.jar" uninstallsvc
}

function start-unifi
{
	Start-Service unifi
}

function stop-unifi
{
	Stop-Service unifi
}

function status-unifi
{
	Get-Service unifi | Format-Table
}

function check-sha256sum
{
	Get-FileHash -Algorithm SHA256 $unifidir$unifilatest | Format-List
}

function install-unifi
{
		Write-Output $unifilatestinfo
	$title    = 'Confirm'
	$question = 'Do you want to continue installing Unifi?'
	$choices  = '&Yes', '&No'

	$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
	if ($decision -eq 0) {
		. $unifidir$unifilatest
	} else {
		Write-Host 'Your choice is No.'
}
}

function Show-Menu
{
    param (
        [string]$Title = 'UniFi Mangement'
    )
    Clear-Host
    Write-Host "================ $Title ================"
	Write-Host ""
	Write-Host "Latest UniFi Installer Found:"
	Write-Host "$unifilatestinfo - $unifilatest"
    Write-Host ""
    Write-Host "Currently Instaled UniFi:"
    Write-Host "$unificurrent"
    Write-Host ""
	Write-Host "1: Stop Service"
    Write-Host "2: Uninstall Service"
	Write-Host "3: Install Latest UniFi"
	Write-Host "4: Install Service"
    Write-Host "5: Start Service"
	Write-Host "6: Service Status"
	Write-Host "7: Check SHA256SUM"
    Write-Host "Q: Press 'Q' to quit."
    Write-Host ""
}

do
 {
     Show-Menu
     $selection = Read-Host "Please make a selection"
     switch ($selection)
     {
		 {($_ -eq '1') -or ($_ -eq 'p')} {
             stop-unifi ; status-unifi; pause
         }

		 {($_ -eq '2') -or ($_ -eq 'u')} {
             uninstall-service ; pause
         }
		 
		 {($_ -eq '3') -or ($_ -eq 'i')} {
             install-unifi ; pause
         }
		 
		 {($_ -eq '4') -or ($_ -eq 'a')} {
             install-service ; pause
         }
		 	 
		 {($_ -eq '5') -or ($_ -eq 't')} {
             start-unifi ; status-unifi; pause
         }
		 		 
		 {($_ -eq '6') -or ($_ -eq 's')} {
			 status-unifi ; pause
		 }
 		 {($_ -eq '7') -or ($_ -eq 'h')} {
			 check-sha256sum ; pause
		 }
     }
#     pause
 }
 until ($selection -eq 'q' -or $selection -eq 'exit' -or $selection -eq '0')