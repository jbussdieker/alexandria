require 'sqlite3'

module Alexandria
  module Data
    class SQLite3
      def initialize(options)
        @db_file = options[:file]
      end

      def users
        db.query("select name from users").collect {|user| user[0]}
      end

      def keys(user)
        user = db.query("select id from users where name='#{user}'").first
        return nil if !user
        db.query("select key_data from rsa_keys where user_id=#{user.first}").collect {|key| key[0]}
      end

      private

      def db
        @db ||= ::SQLite3::Database.new(@db_file)
      end
    end
  end
end
