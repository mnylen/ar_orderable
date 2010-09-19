require "spec_helper"

describe "ordering by multiple attributes" do
  before(:each) do
    valve = Factory.create(:developer, :name => "Valve")
    portal = Factory.create(:game, :name => "Portal", :developer => valve)
    half_life = Factory.create(:game, :name => "Half-Life", :developer => valve)
    
    ea_redwood_shores = Factory.create(:developer, :name => "EA Redwood Shores")
    the_godfather = Factory.create(:game, :name => "The Godfather", :developer => ea_redwood_shores)
    dead_space = Factory.create(:game, :name => "Dead Space", :developer => ea_redwood_shores)
    
    @games_in_order = [dead_space, the_godfather, half_life, portal]
  end
  
  it "should order by all attributes in given list" do
    Game.order([:"developer.name", :name]).should == @games_in_order
  end
end