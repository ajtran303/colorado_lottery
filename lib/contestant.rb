class Contestant
  attr_reader :full_name,
              :age,
              :state_of_residence,
              :spending_money,
              :game_interests

  def initialize(contestant_information)
    @full_name = "#{contestant_information[:first_name]} #{contestant_information[:last_name]}"
    @age = contestant_information[:age]
    @state_of_residence = contestant_information[:state_of_residence]
    @spending_money = contestant_information[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    @state_of_residence != "CO"
  end

  def add_game_interest(game)
    @game_interests << game
  end

  def charge(amount)
    @spending_money -= amount
  end

end
