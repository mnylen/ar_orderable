require "spec_helper"

describe "order" do
  before(:each) do
    @dead_space = Factory.create(:game, :name => "Dead Space", :created_at => 10.minutes.ago)
    @batman = Factory.create(:game, :name => "Batman: Arkham Asylum", :created_at => 1.minute.ago)
    @half_life = Factory.create(:game, :name => "Half-Life", :created_at => Time.now)
  end
  
  it "should order by name given ':name' symbol" do
    Game.order(:name).should be_in_order(:name)
  end
  
  it "should order by name given 'name' string" do
    Game.order("name").should be_in_order(:name)
  end
  
  it "should behave like order(:name) given ':name!asc'" do
    Game.order(:"name!asc").should be_in_order(:name)
  end
  
  it "should order by name in descending order given ':name!desc'" do
    Game.order(:"name!desc").reverse.should be_in_order(:name)
  end
  
  it "should use default ordering if the model is not orderable by the given attribute" do
    Game.order(:updated_at).should be_in_order(:created_at)
  end
end