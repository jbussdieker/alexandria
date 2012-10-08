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
    elsif ARGV[0] == "write_keys"
      puts "Generating authorized keys..."
      key_data = User.generate_keys
      FileUtils.mkdir_p File.dirname(config.key_file)
      File.open(config.key_file, "w") {|f| f.write(key_data) }
      puts "Authorized keys written to: #{config.key_file}"
    elsif ARGV[0] == "list_users"
      puts "Getting user list..."
      users = User.all
      users.each do |user|
        puts " * #{user.name}"
      end
    elsif ARGV[0] == "gen_config"
      puts config.to_yaml
    else
      puts "Invalid command #{ARGV[0]}" if ARGV[0]
      puts "Usage:"
      puts
      puts "  commands: list_users, write_keys"
      puts
    end
  end
end
