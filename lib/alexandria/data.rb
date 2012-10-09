require 'alexandria/data/yaml'
require 'alexandria/data/sqlite3'

module Alexandria
  module Data
    def self.new(config)
      if config[:driver] == :yaml
        Alexandria::Data::YAML.new(config)
      elsif config[:driver] == :sqlite3
        Alexandria::Data::SQLite3.new(config)
      end
    end
  end
end
