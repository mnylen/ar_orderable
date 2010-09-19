require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default, :test)

require 'active_record'
require File.join(File.dirname(__FILE__), '..', 'init')
require File.join(File.dirname(__FILE__), 'support', 'lib', 'activerecord_test_connector')
ActiveRecordTestConnector.setup

require 'spec'
require 'active_support'
require 'factory_girl'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
  config.before(:each) do
    Game.delete_all
    Developer.delete_all
  end
end