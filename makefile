.PHONY: init

init:
	make install_brew
	make install_packages
	make install_oh_my_zsh
	make install_spacemacs
	make copy_configs

install_brew:
	echo "Start to install Homebrew..."
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install_packages:
	echo "Start to install useful packages by homebrew"
	./brew.sh

install_oh_my_zsh:
	echo "Start to install Oh-my-zsh"
	sh -c "$$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

install_spacemacs:
	echo "alias emacs=\"$$(brew --prefix emacs-plus)/bin/emacs\"" >> $(HOME)/.zshrc
	git clone https://github.com/syl20bnr/spacemacs $(HOME)/.emacs.d

copy_configs:
	cp ./configs/* $(HOME)