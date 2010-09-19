class Developer < ActiveRecord::Base
  has_many :games
  
  orderable :by => [:name]
end