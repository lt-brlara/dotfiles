
source ./logging.sh

SCRIPTENTRY

installed_programs=()
uninstalled_programs=()

function install_brew() {
  ENTRY
  
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  EXIT
}

function install_brewfile() {
  ENTRY
  brew bundle --file=~/Brewfile
  EXIT
}

function install_missing_software() {
  ENTRY

  for program in "${uninstalled_programs[@]}" ;do
    brew install $program
  done
 
  EXIT
}

function if_is_installed() {
  ENTRY
  if command -v $1 >/dev/null; then
    INFO "$1 is installed"
    installed_programs+=($1)
  else
    WARN "$1 is not installed"
    uninstalled_programs+=($1)
  fi
  EXIT
}

function request_permission() {

  if read -q "choice?Press Y/y to $1: "; then
    echo
    $2
  else
    echo
    echo "'$choice' not 'Y' or 'y'. Exiting..."
  fi

}

SCRIPTEXIT
