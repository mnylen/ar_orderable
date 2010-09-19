require "spec_helper"

describe "order by attribute in belongs_to association" do
  before(:each) do
    @ea_redwood_shores = Factory.create(:developer, :name => "EA Redwood Shores")
    @dead_space = Factory.create(:game, :name => "Dead Space", :developer => @ea_redwood_shores, :created_at => 10.minutes.ago)
    
    @rocksteady_studios = Factory.create(:developer, :name => "Rocksteady Studios")
    @batman = Factory.create(:game, :name => "Batman: Arkham Asylum", :developer => @rocksteady_studios, :created_at => 1.minute.ago)
    
    @valve = Factory.create(:developer, :name => "Valve")
    @half_life = Factory.create(:game, :name => "Half-Life", :developer => @valve, :created_at => Time.now)
  end
  
  it "should order by developer name given :'developer.name'" do
    Game.order(:'developer.name').should be_in_order(:'developer.name')
  end
  
  it "should behave like order(:'developer.name') given ':'developer.name!asc'" do
    Game.order(:'developer.name!asc').should be_in_order(:'developer.name')
  end
  
  it "should order by developer name in descending order given ':'developer.name!desc'" do
    Game.order(:"developer.name!desc").reverse.should be_in_order(:'developer.name')
  end
end