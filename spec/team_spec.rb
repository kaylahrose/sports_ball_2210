require './lib/player'
require './lib/team'

RSpec.describe Team do
  let(:team) { Team.new('Dodgers', 'Los Angeles') }
  let(:player_1) { Player.new('Michael Palledorous', 1_000_000, 36) }
  let(:player_2) { Player.new('Kenny DeNunez', 500_000, 24) }
  let(:player_3) { Player.new('Alan McClennan', 750_000, 48) }
  let(:player_4) { Player.new('Hamilton Porter', 100_000, 12) }

  it 'exists' do
    expect(team).to be_instance_of(Team)
  end

  it 'has a roster' do
    expect(team.roster).to eq([])
  end

  it 'counts players' do
    expect(team.player_count).to eq(0)

    team.add_player(player_1)
    team.add_player(player_2)
    # require 'pry'; binding.pry
    expect(team.player_count).to eq(2)
  end

  it 'adds people to the team' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.roster

    expect(team.roster[0]).to eq(player_1)
    expect(team.roster[-1]).to eq(player_2)
  end

  it 'identifies long-term players' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.long_term_players).to eq([player_1, player_3])
  end

  it 'identifies short-term players' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.short_term_players).to eq([player_2, player_4])
  end

  it 'finds the total value' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.total_value).to eq(85_200_000)
  end

  it 'returns team details' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.details).to eq({ 'total_value' => 85_200_000, 'player_count' => 4 })
  end

  it 'returns average cost of player' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.average_cost_of_player).to eq('$21,300,000')
  end

  it 'returns players last names alphabetized' do
    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.players_by_last_name).to eq('DeNunez, McClennan, Palledorous, Porter')
  end
end
