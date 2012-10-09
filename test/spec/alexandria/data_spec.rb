require 'rspec'
require 'alexandria/data'

describe Alexandria::Data do
  it 'should create the yaml driver' do
    d = Alexandria::Data.new(:driver => :yaml)
    d.should be_an_instance_of Alexandria::Data::YAML
  end

  it 'should create the sqlite3 driver' do
    d = Alexandria::Data.new(:driver => :sqlite3)
    d.should be_an_instance_of Alexandria::Data::SQLite3
  end
end
