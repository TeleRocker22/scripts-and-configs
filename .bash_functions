# bash shell functions

function rsha1sum() {

  if
    (( $# )) # True if at least one argument present
  then
    folder=$1
  else
    folder=./
  fi

  find "$folder" -type f -exec sha1sum -b {} \;

}

function rsha256sum() {

  if
    (( $# )) # True if at least one argument present
  then
    folder=$1
  else
    folder=./
  fi

  find "$folder" -type f -exec sha256sum -b {} \;

}

function rsha256sumbsd() {

  if
    (( $# )) # True if at least one argument present
  then
    folder=$1
  else
    folder=./
  fi

  find "$folder" -type f -exec sha256sum --tag {} \;

}

function rsha512sum() {

  if
    (( $# )) # True if at least one argument present
  then
    folder=$1
  else
    folder=./
  fi

  find "$folder" -type f -exec sha512sum -b {} \;
 
}

function rmd5sum() {

  if
    (( $# )) # True if at least one argument present
  then
    folder=$1
  else
    folder=./
  fi

  find "$folder" -type f -exec md5sum -b {} \;

}

function up () {

  sudo apt update
  sudo apt full-upgrade
  sudo apt autoremove
  sudo snap refresh
  flatpak upgrade

  if [ -f /var/run/reboot-required ]; then
    echo 'Reboot Required'
    cat /var/run/reboot-required.pkgs
  else
    echo 'No Reboot Required'
  fi
