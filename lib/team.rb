class Team
    attr_reader :team, :city
    attr_accessor :roster

    def initialize(team, city)
        @team = team
        @city = city
        @roster = []
    end

    def player_count
        @roster.length
    end

    def add_player(teammate)
        @roster << teammate
    end

    def long_term_players
        @roster.select do |player|
            player.contract_length > 24
        end
    end

    def short_term_players
        @roster.select do |player|
            player.contract_length <= 24
        end
    end

    def total_value
        sum = @roster.reduce(0) do |sum, player|
            sum + player.total_cost
        end
    end

    def details
        {
          :total_value =>total_value,
          :player_count =>player_count
        }
    end
end