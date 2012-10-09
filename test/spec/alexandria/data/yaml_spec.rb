require 'rspec'
require 'alexandria/data/yaml'

describe Alexandria::Data::YAML do
  YAML_TEST_FILE = File.expand_path('../../../../data/data.yml', __FILE__)

  it 'should provide a user list' do
    d = Alexandria::Data::YAML.new(:file => YAML_TEST_FILE)
    d.users.should eql(['john_doe', 'jane_doe'])
  end

  it 'should return nil for non-existant users' do
    d = Alexandria::Data::YAML.new(:file => YAML_TEST_FILE)
    d.keys('doesntexist').should eql(nil)
  end

  it 'should provide a user\'s keys' do
    d = Alexandria::Data::YAML.new(:file => YAML_TEST_FILE)
    d.keys('john_doe').should eql(['a', 'b'])
  end
end
