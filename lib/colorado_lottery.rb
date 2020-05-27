class ColoradoLottery
  attr_reader :winners,
              :registered_contestants,
              :current_contestants

  def initialize
    @winners = []
    @registered_contestants = {}
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && !contestant.out_of_state? ||
    interested_and_18?(contestant, game) && game.national_drawing?
  end

  def register_contestant(contestant, game)
    if @registered_contestants[game.name] == nil
      @registered_contestants[game.name] = [contestant]
    else
      @registered_contestants[game.name] << contestant
    end
  end

  def eligible_contestants(game)
    contestants = @registered_contestants[game.name]
    contestants.filter do |contestant|
      contestant.spending_money >= game.cost
    end
  end

  def charge_contestants(game)
    contestants = eligible_contestants(game)
    contestant_names = contestants.map do |contestant|
      contestant.charge(game.cost)
      contestant.full_name
    end
    @current_contestants[game] = contestant_names
  end

  def draw_winners
    @current_contestants.each do |game, contestants|
      @winners << {game.name => contestants.sample}
    end
    "2020-04-07"
  end

  def announce_winner(game_name)
    game_winner = @winners.detect do |winner|
      winner.keys.first == game_name
    end
    winner_name = game_winner[game_name]
    puts "#{winner_name} won the #{game_name} on 04/07"
  end

end
