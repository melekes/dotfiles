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

  process_templates(Dir.glob("#{ENV["PWD"]}/**/*.erb"))
  file_operation(Dir.glob("#{ENV["PWD"]}/**/*.symlink"))

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
    files.each do |f|
      # TODO how to handle erb templates?
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
