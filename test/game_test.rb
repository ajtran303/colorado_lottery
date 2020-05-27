require "minitest/autorun"
require "minitest/pride"
require "./lib/game"

class GameTest < MiniTest::Test

	def setup
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
	end

  def test_it_exists_with_attributes
    assert_instance_of Game, @pick_4
    assert_instance_of Game, @mega_millions

    assert_equal "Mega Millions", @mega_millions.name
    assert_equal 5, @mega_millions.cost

    assert_equal "Pick 4", @pick_4.name
    assert_equal 2, @pick_4.cost
  end

  def test_it_can_be_a_national_drawing
    assert_equal true, @mega_millions.national_drawing?
    assert_equal false, @pick_4.national_drawing?
  end

end
