require "alexandria/version"
require "alexandria/config"
require "alexandria/command"
require "alexandria/user"

require "erb"
require "fileutils"

module Alexandria
  def self.run
    config = Alexandria::Config.new

    if ARGV[0] == "ssh"
      user = Alexandria::User.new(ARGV[1])
      command = Alexandria::Command.new(ENV['SSH_ORIGINAL_COMMAND'])
      command.run(config, user)
    elsif ARGV[0] == "setup"
      if ENV['USER'] == config.git_user
        puts "Generating authorized keys..."
        key_data = User.generate_keys
        FileUtils.mkdir_p File.dirname(config.key_file)
        FileUtils.mkdir_p File.join(config.repo_dir)
        File.open(config.key_file, "w") {|f| f.write(key_data) }
        puts "Authorized keys written to: #{config.key_file}"
      else
        puts "Please run setup as #{config.git_user}"
      end
    elsif ARGV[0] == "create"
      if ENV['USER'] == config.git_user
        FileUtils.mkdir_p File.join(config.repo_dir, ARGV[1])
        FileUtils.chdir File.join(config.repo_dir, ARGV[1])
        Kernel.exec 'git', 'init', '--bare'
      else
        puts "Please run create as #{config.git_user}"
      end
    else
      puts "Invalid command #{ARGV[0]}" if ARGV[0]
      puts "Usage:"
      puts
      puts "  commands: setup, create"
      puts
    end
  end
end
