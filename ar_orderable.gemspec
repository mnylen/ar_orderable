# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ar_orderable}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mikko Nyl\303\251n"]
  s.date = %q{2010-09-19}
  s.description = %q{ar_orderable adds a consistent way to order results at database level using ActiveRecord. Supports ordering by multiple attributes and by associated model's attributes.}
  s.email = %q{mikko.nylen@gmail.com}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "README.textile",
     "Rakefile",
     "VERSION",
     "ar_orderable.gemspec",
     "init.rb",
     "lib/orderable.rb",
     "spec/order_belongs_to_association_spec.rb",
     "spec/order_case_sensitivity_spec.rb",
     "spec/order_multiple_attributes_spec.rb",
     "spec/order_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/database.yml",
     "spec/support/factories.rb",
     "spec/support/lib/activerecord_test_connector.rb",
     "spec/support/matchers/be_in_order.rb",
     "spec/support/models/developer.rb",
     "spec/support/models/game.rb",
     "spec/support/schema.rb"
  ]
  s.homepage = %q{http://github.com/mnylen/ar_orderable}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A small ActiveRecord addition that makes ordering of results easier and cleaner}
  s.test_files = [
    "spec/order_belongs_to_association_spec.rb",
     "spec/order_case_sensitivity_spec.rb",
     "spec/order_multiple_attributes_spec.rb",
     "spec/order_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/factories.rb",
     "spec/support/lib/activerecord_test_connector.rb",
     "spec/support/matchers/be_in_order.rb",
     "spec/support/models/developer.rb",
     "spec/support/models/game.rb",
     "spec/support/schema.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 2.3.5"])
    else
      s.add_dependency(%q<activerecord>, ["~> 2.3.5"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 2.3.5"])
  end
end

