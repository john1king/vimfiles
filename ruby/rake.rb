def read(file)
  open(file,'r:utf-8'){|f| f.read }
end

def write(file, content)
  open(file,'w:utf-8') { |f| f.write content}
end

# @note 双引号用于防止用户名中包含空格时出错，不能用单引号代替
def to_arg(s)
  s.include?(' ') ? %("#{s}") : s
end

def os
 /darwin/ =~ RUBY_PLATFORM ? 'mac' : 'win'
end

def vim
  os == 'mac' ? 'mvim -v' : 'vim'
end

# @todo 处理 namespace
def rake(name)
  Rake::Task[name].invoke
end


# 合并 vim 配置文件，使用 @requrire 指定想要加载的文件
def vim_require(main)
  main.gsub(/^\s*"\s*@require\s*(.*)$/) do |m|
      filelist =  $1.split(',').map {|f| "config/#{f.strip}.vim"}.select {|f| File.exist?(f) }
      merge(filelist)
  end
end


require 'stringio'

class MergeFile

  def self.merge(filelist)
    filelist.map {|file| read(file).strip }.join("\n")
  end

  def initialize(dir, format)
    filelist = Dir.foreach(dir)
                  .select { |f| File.extname(f) == format }
                  .map { |f| File.join(dir, f) }

    @text = StringIO.new(self.class.merge(filelist), 'rb') 
    @filename = File.basename(dir) + format
  end

  def copy_to(dest)
    dest = File.join(dest, @filename) if File.directory?(dest)
    File.copy_stream(@text, File.new(dest, 'wb'))
  end

end 

def merge(filelist)
  MergeFile.merge(filelist)
end

