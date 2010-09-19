require File.join(File.dirname(__FILE__), 'lib', 'orderable')
ActiveRecord::Base.send(:include, Orderable)