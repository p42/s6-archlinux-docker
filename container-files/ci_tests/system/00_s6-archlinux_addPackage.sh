#!/usr/bin/with-contenv bash

# Shell Colors
set_shell_error() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[5m" # Style: blink
  echo -e "\e[31m" # Text Color: Red
}

set_shell_info() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[33m" # Text Color: Yellow
}

set_shell_pass() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[32m" # Text Color: Green
}

set_shell_warning() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[35m" # Text Color: Magenta
}

reset_shell() {
  echo -e "\e[0m" # Reset all shell attributes
}

# Check to see if packages are preinstalled
COWFORTUNE_INSTALLED=false
pacman -Q --check cowfortune
if [ $? -eq 0 ]; then

  set_shell_info
  echo "cowfortune already installed skipping step"
  reset_shell

  COWFORTUNE_INSTALLED=true
fi

#Make sure packages can be installed
if ! $COWFORTUNE_INSTALLED; then

  pacman -Sy --noconfirm cowfortune
  pacman -Q --check cowfortune
  if [ $? -ne 0 ]; then

    set_shell_error
    echo "TEST: installation of cowfortune FAILED"
    reset_shell

    exit 1
  fi
fi

fortune | cowsay -n
if [ $? -ne 0 ]; then

  set_shell_error
  echo "TEST: really.. you got this far and cowsay FAILED"
  reset_shell

  exit 1
fi


# Clean up time
if ! $COWFORTUNE_INSTALLED; then

  set_shell_info
  echo "uninstalling cowfortune"
  reset_shell

  pacman -Rs --noconfirm cowfortune
fi

rm -f /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /etc/pacman.d/mirrorlist.pacnew

exit 0
