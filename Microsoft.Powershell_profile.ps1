function sshtemp {
    ssh.exe $Args[0] -o "UserKnownHostsFile=/dev/null"
}

function up {
	winget.exe upgrade
}

function sha256sum {
	Get-FileHash -Algorithm SHA256 $Args | Format-List
}

function sha512sum {
	Get-FileHash -Algorithm SHA512 $Args | Format-List
}

function sha1sum {
	Get-FileHash -Algorithm SHA1 $Args | Format-List
}

function md5sum {
	Get-FileHash -Algorithm MD5 $Args | Format-List
}

function checkhealth {
	DISM /Online /Cleanup-Image /ScanHealth
}

function restorehealth {
	DISM /Online /Cleanup-Image /RestoreHealth
}

function sfcrepair {
	SFC /scannow
}
