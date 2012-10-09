require "alexandria/data"

module Alexandria
  class User
    attr_accessor :name

    def self.all(config)
      Alexandria::Data.new(config).users.collect {|user|
        User.new(user, config)
      }
    end

    def self.generate_keys(config)
      result = ""
      users = User.all(config)
      users.each do |user|
        result << user.generate_keys
      end
      result
    end

    def initialize(name, config)
      @name = name
      @config = config
      @ssh_keys = Alexandria::Data.new(@config).keys(name).collect {|k|
        k
      }
    end

    def generate_keys
      template_file = File.expand_path('../../../templates/keys.erb', __FILE__)
      template = ERB.new(File.open(template_file).read)
      template.result(binding)
    end

    def keys
      @ssh_keys
    end
  end
end
