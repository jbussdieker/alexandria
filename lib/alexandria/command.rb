require 'fileutils'

module Alexandria
  class Command
    def run(config, user)
      File.open(config.log_file, "a") {|f| f.write("[DEBUG]\t#{Time.now}\t#{user.name}\t#{@command}\n") }
      FileUtils.chdir(config.repo_dir)
      Kernel.exec 'git', 'shell', '-c', @command
    end

    def name
      @command.split[0]
    end

    def initialize(command="")
      @command = command
    end
  end
end
