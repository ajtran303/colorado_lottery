require "minitest/autorun"
require "minitest/pride"
require "./lib/contestant"
require "./lib/game"

class ContestantTest < MiniTest::Test

	def setup
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)

    @alexander = Contestant.new(
      {first_name: 'Alexander',
      last_name: 'Aigiades',
      age: 28,
      state_of_residence: 'CO',
      spending_money: 10})
  end

  def test_it_exists_with_attributes
    assert_instance_of Contestant, @alexander
    assert_equal "Alexander Aigiades", @alexander.full_name
    assert_equal 28, @alexander.age
    assert_equal "CO", @alexander.state_of_residence
    assert_equal 10, @alexander.spending_money
  end

  def test_it_is_out_of_state_if_not_colorado
    assert_equal false, @alexander.out_of_state?

    californian = Contestant.new(
      {first_name: 'Some',
      last_name: 'Person',
      age: 28,
      state_of_residence: 'CA',
      spending_money: 10})

    assert_equal true, californian.out_of_state?
  end

  def test_it_can_have_game_interests
    assert_equal [], @alexander.game_interests

    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')

    assert_equal ["Mega Millions", "Pick 4"], @alexander.game_interests
  end

  def test_it_can_get_charged
    assert_equal 10, @alexander.spending_money
    @alexander.charge(1)
    assert_equal 9, @alexander.spending_money
  end

end
