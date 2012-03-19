
配置文件介绍
============

- **config:** 配置文件分类目录，安装时会被合并到 vimrc 中

  - **vundle:** 使用的插件列表
  - **clone:** 从别人的配置中复制的函数
  - **function:** 自己编写的实用函数
  - **mapping:** 按键映射
  - **plugin:** 插件设置和快捷键
  - **command:** 自定义 command 及设置
  - **filetype:** 文件类型设置

- **install:** 安装时使用的文件

  - **curl.cmd:** vundle 下载插件时使用
  - **ctags:** javascript 的 ctags 模式
  - **install.vim:** 用于获取 vim 的安装目录
  - **sample.cmd:** windows 自定义命名行的例子

- **ruby:** ruby 的辅助脚本

- **sinppets:** snipMate 代码补全，文件夹内的 snippets 会被合并


Rake 命令
---------

- `rake i[nstall]` 自动安装
- `rake s[nippets]` 更新 snippets
- `rake u[update]` 更新 vimrc
- `rake exe:task_name` 供外部调用时使用，如 `rake -f <your/clone/path>/Rakefile exe:install`

Windows 下的安装步骤
====================

1. 安装 [ruby 1.9.2](http://rubyinstaller.org/downloads/) 以上版本及 [msysgit](http://code.google.com/p/msysgit/downloads/list)

2. 下载 [gvim](http://www.vim.org/download.php) , 并安装到喜欢的位置

3. 安装完成后需要能够在 cmd 使用 ruby, git, gvim 命令，通常有以下两种做法

   1. 创建 `.cmd` 或 `.bat` 文件，复制到 PATH 中已存在的目录下，
      如 `/system32`。格式可以参考 `install/sample.cmd`

   2. 将程序的安装路径添加到 PATH 中， 注意在 PATH 中添加新的路径后，需要注销或重启才能够在 git bash 中使用

3. 执行 `rake i[nstall]`  


Mac OS X 下的安装步骤
=====================

1. 下载安装 [MacVim](http://code.google.com/p/macvim/) 

2. 打开终端，进入解压后的文件夹并执行 `sudo cp mvim /usr/local/bin/`

3. 执行 `rake i[nstall]`

**插件较多的情况下部分安装可能失败, 启动 vim 后建议再次输入 `BundleInstall` 命令确认安装情况**



安装外部(可选)
==============

部分命令调用了外部程序，这些程序需要能够在 shell 中使用。不使用这些命令可以跳过此部分

命令行
------

- `Csstidy` [csstidy](http://csstidy.sourceforge.net/download.php) 命令，格式化 css。可以使用 `Cssformat` 来代替，功能较为简单，但不需要安装外部程序
-  `,r` chrome 命令，文件类型为 html 时调用浏览器
- `<F4>` ctags 命令，tagbar 插件， 需要安装 [Exuberant Ctags](http://ctags.sourceforge.net/)

手动安装中文帮助文档
--------------------

中文文档同样可以使用 vundle 管理，下面简单介绍手动安装的步骤

1. 下载[中文文档](http://vimcdoc.sourceforge.net/)
 
2. 将 doc 文件夹拷贝到 vim runtimepath 之一的 doc 目录下,
   `:echo &rtp` 可以查看完整的 runtimepath

   通常可以选择安装到以下的目录
   - Mac `~/.vim/doc/` 
   - Windows `gvim/vim73/vimfiles/doc/`

3. 在 vimrc 中添加 `set helplang=cn`
