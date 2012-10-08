require "alexandria/data"

module Alexandria
  class User
    attr_accessor :name

    def self.all
      Alexandria::Data.user_list.collect {|user|
        User.new(user)
      }
    end

    def self.generate_keys
      result = ""
      users = User.all
      users.each do |user|
        result << user.generate_keys
      end
      result
    end

    def initialize(name="")
      @name = name
      @ssh_keys = Alexandria::Data.user_keys(name).collect {|k|
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
