require 'rspec'
require 'alexandria/data/sqlite3'

describe Alexandria::Data::SQLite3 do
  SQLITE3_TEST_FILE = File.expand_path("../../../../data/db.sqlite3", __FILE__)

  it 'should provide a user list' do
    d = Alexandria::Data::SQLite3.new(:file => SQLITE3_TEST_FILE)
    d.users.should eql(['john_doe', 'jane_doe'])
  end

  it 'should return [] for non-existant users' do
    d = Alexandria::Data::SQLite3.new(:file => SQLITE3_TEST_FILE)
    d.keys('doesntexist').should eql(nil)
  end

  it 'should provide a user\'s keys' do
    d = Alexandria::Data::SQLite3.new(:file => SQLITE3_TEST_FILE)
    d.keys('john_doe').should eql(['a', 'b'])
  end
end
