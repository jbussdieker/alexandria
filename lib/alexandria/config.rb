module Alexandria
  class Config
    attr_accessor :key_file, :git_user, :repo_dir

    def initialize
      @git_user = "git"
      @repo_dir = "/home/#{@git_user}/repos"
      @key_file = "/home/#{@git_user}/.ssh/authorized_keys"
    end
  end
end
