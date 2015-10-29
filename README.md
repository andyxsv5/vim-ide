# vim-ide
手把手教如何使用vim构建ide开发环境。
##1 安装git
sudo yum install -y git
##2 clone源文件
git clone git@github.com:andyxsv5/vim-ide.git
##3 替换vimrc文件
cp -a vim-ide/vimrc ~/.vimrc
##4 安装插件
打开vim，然后在normal模式下输入命令:BundleInstall，自动安装完成
##5 创建cscope和ctag索引构建脚本
cp vim-ide/doctag.sh /usr/bin/doctag.sh;
cp vim-ide/docscope.sh /usr/bin/docscope.sh
