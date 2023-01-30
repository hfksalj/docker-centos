sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

yum makecache
yum remove -y vim-*
yum install -y git
yum install -y make
yum install gcc gcc-c++ -y
yum install ncurses-devel -y
yum install python3 python3-devel -y


git clone --depth 1 https://github.com/vim/vim ~/vim
cd ~/vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local/vim
make && make install

echo "export PATH=$PATH:/usr/local/vim/bin" >> ~/.bashrc
source ~/.bashrc

yum install -y tmux
curl -fsSL https://rpm.nodesource.com/setup_16.x | bash -
sleep 10
yum install -y nodejs
dnf install -y clang-tools-extra.x86_64



curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa

mkdir -p $HOME/.config/coc/extensions
cd $HOME/.config/coc/extensions
echo '{"dependencies": {}}' > package.json
  npm install \
  coc-eslint \
  coc-prettier \
  coc-tsserver \
  coc-json \
  coc-html \
  coc-css \
  coc-snippets \
  @yaegassy/coc-tailwindcss3 \
  coc-clangd \
  coc-go \
  --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod


mv -f ~/.vimrc.final ~/.vimrc
mv -f ~/bear /usr/bin/
rm -rf ~/vim  
ln -s /usr/bin/python3 /usr/bin/python
