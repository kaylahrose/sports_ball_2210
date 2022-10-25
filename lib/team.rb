class Team
    attr_reader :roster
  
    def initialize(_name, _city)
      @roster = []
    end
  
    def player_count
      roster.count
    end
  
    def add_player(player)
      @roster << player
    end
  
    def long_term_players
      roster.find_all do |player|
        player if player.contract_length > 24
      end
    end
  
    def short_term_players
      roster.find_all do |player|
        player if player.contract_length <= 24
      end
    end
  
    def total_value
      roster.sum do |player|
        player.contract_length * player.monthly_cost
      end
    end
  
    def details
      { 'player_count' => player_count, 'total_value' => total_value }
    end
  
    def average_cost_of_player
      reverse = (total_value / player_count).to_s.reverse
      reverse.scan(/.{1,3}/).join(',').reverse.prepend('$')
    end
  
    def players_by_last_name
      roster.map do |player|
        player.last_name
      end.sort.join(', ')
    end
  end
  