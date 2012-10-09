require 'yaml'

module Alexandria
  module Data
    class YAML
      def initialize(options)
        @yaml_file = options[:file]
      end

      def users
        data[:users]
      end

      def keys(user)
        data[:keys][user]
      end

      private

      def data
        @data ||= ::YAML.load(File.read(@yaml_file))
      end
    end
  end
end
