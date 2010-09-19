class Game < ActiveRecord::Base
  belongs_to :developer
  
  orderable :by => [:name, :created_at, :"developer.name"], :default => :created_at
end