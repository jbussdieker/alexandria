require 'fileutils'

module Alexandria
  class Command
    def run(config, user)
      FileUtils.chdir(config.repo_dir)
      Kernel.exec 'git', 'shell', '-c', @command
    end

    def name
      @command.split[0]
    end

    def repository
      if ['git-receive-pack', 'git-upload-pack'].include? name
        # given `git clone git@git:some/dir` the arg is 'some/dir'
        @repository ||= Repository.new(@command.split[1][1..-2])
      end
    end

    def initialize(command="")
      @command = command
    end
  end
end
