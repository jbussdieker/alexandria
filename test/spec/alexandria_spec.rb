require 'rspec'
require 'alexandria'

describe Alexandria do
  it 'should have a valid version' do
    Gem::Version.new(Alexandria::VERSION).to_s.should eql(Alexandria::VERSION)
  end
end
