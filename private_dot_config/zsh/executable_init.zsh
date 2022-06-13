#! /bin/zsh

required_programs=(
  gpg
)

export $XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
source $ZDOTDIR/funcs.zsh

if ! if_is_installed brew; then
  request_permission "install brew" install_brew
fi

for program in "${required_programs[@]}" ;do
  if_is_installed $program
done

if [ ${#uninstalled_programs[@]} -eq 0 ]; then
  echo "No missing software, continuing with the rest of profile loading..."

else

  echo "Detected missing software:\n
    $uninstalled_programs\n
Requesting permission to install."

request_permission "install missing software" install_missing_software

fi

request_permission "execute 'brew bundle'" install_brewfile

echo "Profile loaded!"

source ~/.zshrc
