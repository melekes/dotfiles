# The original idea were grabbed from:
#   https://github.com/skwp/dotfiles/blob/master/Rakefile

require 'rake'
require 'erb'

desc "Hook our dotfiles into system-standard positions."
task :install do
  puts
  puts "======================================================"
  puts "Installing dotfiles"
  puts "======================================================"
  puts

  process_templates(Dir.glob("#{ENV["PWD"]}/**/.*.erb"))
  file_operation(Dir.glob("#{ENV["PWD"]}/**/.*.symlink"))

  puts
  puts "======================================================"
  puts "Installation finished successfully. Restart your terminal."
  puts "======================================================"
  puts
end

task :default => 'install'

private

  def run(cmd)
    puts "[Running] #{cmd}"
    `#{cmd}` unless ENV['DEBUG']
  end

  def process_templates(files)
    # .gitconfig requirements
    @user = {}
    STDOUT.puts "Your email:"
    @user[:email] = STDIN.gets.strip
    STDOUT.puts "Your fullname:"
    @user[:fullname] = STDIN.gets.strip

    # zshrc requirements
    STDOUT.puts "oh-my-zsh theme (default: robbyrussell):"
    @theme = STDIN.gets.strip
    @theme = "robbyrussell" if @theme.blank?

    files.each do |f|
      result = ERB.new(File.read(f)).result(binding)
      result_file = f.chomp(File.extname(f))
      File.open(result_file, 'w+') do |file|
        file.write(result)
      end
    end
  end

  def file_operation(files, method = :symlink)
    files.each do |f|
      file = File.basename(f, '.*')
      source = f
      target = "#{ENV["HOME"]}/#{file}"

      puts "======================#{file}=============================="
      puts "Source: #{source}"
      puts "Target: #{target}"

      if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
        puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
        run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
      end

      if method == :symlink
        run %{ ln -nfs "#{source}" "#{target}" }
      else
        run %{ cp -f "#{source}" "#{target}" }
      end

      puts "=========================================================="
      puts
    end
  end
