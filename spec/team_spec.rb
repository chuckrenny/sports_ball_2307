require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  let(:team) {Team.new("Dodgers", "Los Angeles")}

  let(:player_1) {Player.new("Michael Palledorous" , 1000000, 36)}
  let(:player_2) {Player.new("Kenny DeNunez", 500000, 24)}
  let(:player_3) {Player.new("Alan McClennan", 750000, 48)}
  let(:player_4) {Player.new("Hamilton Porter", 100000, 12)}

  it 'exists' do
    expect(team).to be_a(Team)
  end

  it 'can access the team attributes' do
    expect(team.team).to eq("Dodgers")
    expect(team.city).to eq("Los Angeles")
    expect(team.roster).to eq([])
  end

  it 'can check the player count on the roster' do
    expect(team.player_count).to eq(0)
  end

  it 'can add players to the roster' do
    team.add_player(player_1)
    team.add_player(player_2)
    expect(team.roster).to eq([player_1, player_2])
    expect(team.player_count).to eq(2)
  end

  it 'can output an array of long term players' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
  
    expect(team.long_term_players).to eq([player_1, player_3])
  end

  it 'can output an array of short term players' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
  
    expect(team.short_term_players).to eq([player_2, player_4])
  end

  it 'can calculate the total value of the team' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.total_value).to eq(85200000)
  end

  it 'can find the team details' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.details).to eq({"total_value": 85200000, "player_count": 4})
  end

  it 'can find the average cost of the player in string format' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.average_cost_of_player).to eq("$21,300,000")
  end

  it 'can find the last names of the players alphabetically in string format' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
    
    expect(team.players_by_last_name).to eq("DeNunez, McClennan, Palledorous, Porter")
  end
end