require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default, :test)

require File.join(File.dirname(__FILE__), 'support', 'lib', 'activerecord_test_connector')
ActiveRecordTestConnector.setup

require 'spec'
require 'active_support'