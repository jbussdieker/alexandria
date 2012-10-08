require 'yaml'

module Alexandria
  class Config
    attr_accessor :key_file, :git_user, :repo_dir, :log_file

    def initialize
      if File.exists? "/etc/alexandria.conf"
        data = File.open("/etc/alexandria.conf").read
        raw = YAML.load(data)
        if raw
          raw.each_pair do |k,v|
            send("#{k}=", v)
          end
        end
      end

      @git_user ||= "git"
      @repo_dir ||= "/home/#{@git_user}/repos"
      @key_file ||= "/home/#{@git_user}/.ssh/authorized_keys"
      @log_file ||= "/home/#{@git_user}/alexandria.log"
      @data ||= Alexandria::Data
    end

    def attributes
      [:key_file, :git_user, :repo_dir, :log_file]
    end

    def to_yaml
      raw = {}
      attributes.each do |attr|
        raw[attr] = send(attr)
      end
      YAML.dump(raw).to_s
    end
  end
end
