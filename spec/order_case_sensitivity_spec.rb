require "spec_helper"

describe "case-sensitivity of ordering" do
  before(:each) do
  
  end
  
  it "should order in case-insensitive manner by default" do
    games = [
      Factory.create(:game, :name => "A"),
      Factory.create(:game, :name => "a"),
      Factory.create(:game, :name => "B")
    ]
    
    Game.order(:name).should == games
  end
  
  
  it "should order in case-sensitive manner when :case_sensitive => true" do
    games = [
      Factory.create(:game, :name => "A"),
      Factory.create(:game, :name => "B"),
      Factory.create(:game, :name => "a")
    ]
    
    Game.order(:name, :case_sensitive => true).should == games
  end
  
  it "should order associated model's attributes in case-insensitive-manner by default" do
    a1 = Factory.create(:developer, :name => "A")
    a2 = Factory.create(:developer, :name => "a")
    b = Factory.create(:developer, :name => "B")
    
    games = [
      Factory.create(:game, :name => "game1", :developer => a1),
      Factory.create(:game, :name => "game2", :developer => a2),
      Factory.create(:game, :name => "game3", :developer => b)
    ]
    
    Game.order(:"developer.name").should == games
  end
  
  it "should order associated model's attributes in case-sensitive manner when :case_sensitive => true" do
    a1 = Factory.create(:developer, :name => "A")
    a2 = Factory.create(:developer, :name => "a")
    b = Factory.create(:developer, :name => "B")
    
    games = [
      Factory.create(:game, :name => "game1", :developer => a1),
      Factory.create(:game, :name => "game3", :developer => b),
      Factory.create(:game, :name => "game2", :developer => a2),
    ]
    
    Game.order(:"developer.name", :case_sensitive => true).should == games
  end
end