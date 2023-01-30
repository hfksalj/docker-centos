sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
yum makecache
yum install -y git
yum install -y tmux
curl -fsSL https://rpm.nodesource.com/setup_16.x | bash -
sleep 10
yum install -y nodejs


#yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
#yum install -y neovim python3-neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
/nvim.appimage --appimage-extract
/squashfs-root/AppRun --version
ln -s /squashfs-root/AppRun /usr/bin/nvim


sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
yum install -y gcc

nvim --headless +PlugInstall +qall
nvim --headless +'CocInstall -sync coc-json' +qall
nvim --headless +'CocInstall -sync coc-prettier' +qall
nvim --headless +'CocInstall -sync coc-eslint' +qall
nvim --headless +'CocInstall -sync coc-tsserver' +qall
nvim --headless +'CocInstall -sync @yaegassy/coc-tailwindcss3' +qall
nvim --headless +'CocInstall -sync coc-clangd' +qall

mv -f ~/.config/nvim/init.vim.final ~/.config/nvim/init.vim
mv ~/.config/nvim/clangd.tar ~/.config/coc/extensions/
