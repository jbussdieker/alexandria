require 'yaml'

module Alexandria
  class Config
    DEFAULT_CONFIG_FILE = "/etc/alexandria/config.yml"
    DEFAULT_CONFIG = {
      :driver => :yaml,
      :file => "/etc/alexandria/users.yml",
      :log_file => "/var/log/alexandria.log",
      :user => "git",
    }

    def key_file
      "/home/#{data[:user]}/.ssh/authorized_keys"
    end

    def repo_dir
      "/home/#{data[:user]}/repos"
    end

    def initialize(file=nil)
      @conf_file = file || DEFAULT_CONFIG_FILE
    end

    def [](key)
      data[key]
    end

    private
    
    def data
      return @raw if @raw

      if File.exists? @conf_file
        # Found config file
        data = File.open(@conf_file).read
        @raw = YAML.load(data)
      else
        # Default config
        @raw = DEFAULT_CONFIG
      end
    end
  end
end
