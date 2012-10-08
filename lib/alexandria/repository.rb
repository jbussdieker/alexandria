module Alexandria
  class Repository
    attr_accessor :name

    def initialize(name="")
      @name = name
    end

    def self.all
      Alexandria::Data.repositories.collect {|repository|
        Repository.new(repository)
      }
    end
  end
end
