require 'rspec'
require 'alexandria/config'

describe Alexandria::Config do
  CONFIG_TEST_FILE = File.expand_path('../../../data/config.yml', __FILE__)

  it 'should load sane defaults' do
    c = Alexandria::Config.new
    c[:driver].should eql(:yaml)
    c[:user].should eql("git")
  end

  it 'should load from file' do
    c = Alexandria::Config.new(CONFIG_TEST_FILE)
    c[:driver].should eql(:sqlite3)
    c[:user].should eql("john_doe")
  end
end
