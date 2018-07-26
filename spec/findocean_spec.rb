require_relative '../lib/findocean'
require 'byebug'

RSpec.describe "Find Ocean" do
  it "is a function" do
    expect(defined? find_ocean()).to eq("method")
  end

  it "should convert the mark in the ocean from W's to O's" do
    # Example 1
    map = [ "LLLLLLLLWW", "LLLLLLLWWW", "WWWLLLLLWW" ]
    coor = [0,9]
    results_map = [ "LLLLLLLLOO", "LLLLLLLOOO", "WWWLLLLLOO" ]
    expect(find_ocean(map, coor[0], coor[1])).to eq(results_map)

    # Example 2
    map2 = [ "WWLWLWWWLL", "LWLLLWLWLL", "LWWWWWLWWW" ]
    coor2 = [0,0]
    results_map2 = [ "OOLWLOOOLL", "LOLLLOLOLL", "LOOOOOLOOO" ]
    expect(find_ocean(map2, coor2[0], coor2[1])).to eq(results_map2)
  end
end
