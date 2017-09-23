#!/bin/bash

#Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install vim
brew install vim --override-system-vi

# Install emacs-plus
brew tap d12frosted/emacs-plus
brew install emacs-plus --with-cocoa
brew linkapps emacs-plus

brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

brew install xz

brew install the_silver_searcher
brew install proxychains-ng

# Install other useful binaries.
brew install ack
brew install dark-mode

brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree

# Install language support
brew install llvm --with-clang --with-asan
brew install python
brew install python3
brew install sbcl
brew install lua
brew install ruby
brew install go
brew install haskell-stack

# Install docker
brew install docker
brew install docker-machine

# Remove outdated versions from the cellar.
brew cleanup
