#!/bin/bash

# Setup Vim first...

# make sure pathogen is installed to ~/.vim/autoload/pathogen.vim
echo 'Downloading and installing pathogen...'
mkdir -p ~/.vim/autoload ~/.vim/bundle && \ curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo 'Success!'

# Install NERDTree
echo 'Installing NERDtree...'
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
echo 'NERDTree successfully installed!'

echo 'Installing vim-rails...'
git clone git://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails
git clone git://github.com/tpope/vim-bundler.git ~/.vim/bundle/vim-bundler

echo 'Installing PHP tools...'
git clone git://github.com/ncm2/ncm2.git ~/.vim/bundle/ncm2
git clone git://github.com/phpactor/phpactor.git ~/.vim/bundle/phpactor
git clone git://github.com/phpactor/ncm2-phpactor.git ~/.vim/bundle/ncm2-phpactor
git clone git://github.com/neomake/neomake.git ~/.vim/bundle/neomake

# Install syntasitc
echo 'Installing syntastic'
git clone --depth=1 https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
echo 'Success!'

# copy the vimrc file to ~/.vimrc
echo 'Copying vimrc to ~/.vimrc'
cp vimrc ~/.vimrc

# copy colors to ~/.vim/colors

cp -r colors ~/.vim/colors

# Check to see if  ZSH installed and that it's the default shell
UNAME_RESULT=`uname -a`
if [ "$UNAME_RESULT" -eq "Darwin" ]
then
    # is this a Mac? ZSH already exists, so set it to the default shell
    chsh -s /bin/zsh;
elif [ "$UNAME_RESULT" -eq "Linux" ]
then
    # is it Linux? I typically only work on systems that have apt-get... use it.
    `sudo apt-get install -y zsh`
    chsh - /bin/zsh;
fi #otherwise I don't want to be on this machine

# install oh-my-zsh!
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# run the powerline font installer

./dependencies/powerline-fonts/install.sh

# copy zshrc to ~/.zshrc
cp zshrc ~/.zshrc

ruby --version
