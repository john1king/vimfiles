# encoding: utf-8

require_relative 'ruby/rake.rb'

def vundle_install
  vundle_rtp =  File.expand_path('~/.vim/bundle/vundle')
  vundle_vim = 'config/vundle.vim'

  unless File.exist?(vundle_rtp)
    sh "git clone http://github.com/gmarik/vundle.git #{to_arg(vundle_rtp)}"
  end

  system "#{vim} -u #{vundle_vim} +BundleInstall +qa"
end

def cp_vimrc(path)
    vimrc_dest = File.expand_path(File.join(path,'.vimrc'))
    write vimrc_dest, vim_require(read('vimrc'))
    puts "cp vimrc #{vimrc_dest}"
    cp 'gvimrc',  File.expand_path(File.join(path,'.gvimrc'))
end


desc '创建保存交换文件的文件夹'
task :temp do
  mkdir_p File.expand_path('~/.vim/_temp')
  mkdir_p File.expand_path('~/.vim/_backup')
  cp 'install/ctags', File.expand_path('~/.ctags')
end


desc '合并snippets并更新'
task :snippets do
  target = File.expand_path('~/.vim/snippets/') 
  mkdir_p target, :verbose => false
  cp_r FileList['snippets/*.snippets'], target, :verbose => false
  FileList['snippets/*/'].map do |dir|
    MergeFile.new(dir, '.snippets').copy_to(target)
  end

  puts "cp -r snippets #{target}"
end

namespace :mac do

  task :update do
    cp_vimrc('~')
  end

  task :install do
    vundle_install
  end

end


namespace :win do
 
  def git_dir
    @git_dir ||= File.expand_path(File.dirname(`where git.exe`)) 
  end

  def vim_dir
    install = '.install'
    unless File.exist?(install)
      system "#{vim} -u install/install.vim +InstallPath"
    end
    result = read(install).strip
    unless File.exist?(result)
      print "WARNING: Can't found the vim install path."
      print "Please try to edit '.install' file."
      exit
    end
    result 
  end

  task :update do
       cp_vimrc(vim_dir)
  end

  task :install do
    rm_f File.join(vim_dir,'_vimrc')
    rm_f File.join(vim_dir,'_gvimrc')
    cp 'install/curl.cmd', git_dir

    vundle_install
  end

end

task :update => "#{os}:update"
task :install => [:temp, :update, :snippets, "#{os}:install"]

task :s => :snippets
task :i => :install
task :u => :update

# 从外部调用 rake -f 命令时使用
namespace :exe do
  %w(snippets install update).each do |t|

    task t do
      cd File.dirname(__FILE__), :verbose => false do
        Rake::Task[t].invoke
      end
    end

  end
end
