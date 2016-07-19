# vim-ide
## 手把手教如何使用vim构建ide开发环境。
###1 安装git
```
sudo yum install -y git
```
###2 clone源文件
```
git clone git@github.com:andyxsv5/vim-ide.git
```
###3 替换vimrc文件
```
cp -a vim-ide/vimrc ~/.vimrc
```
###4 安装插件
```
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
打开vim，然后在normal模式下输入命令:BundleInstall，自动安装完成
```
> 如果主机无法联网，比如自己在公司内网的服务器上进行编程，可以使用vim-plugin.tar.gz包解压到~/.vim目录下
```
 mkdir -p ~/.vim/
 tar -xzvf vim-plugin.tar.gz -C ~/.vim/
```

###5. 设置环境变量
```
export MYWORKSPACE=/youworkspace/path
export CSCOPE_DB=$MYWORKSPACE/cscope.out
```

###6 创建cscope和ctag索引构建脚本
```
sudo cp vim-ide/doctags.sh /usr/bin/doctags.sh
sudo chmod +x /usr/bin/doctags.sh
doctags.sh

sudo cp vim-ide/docscope.sh /usr/bin/docscope.sh
sudo chmod +x /usr/bin/docscope.sh
docscope.sh
```

