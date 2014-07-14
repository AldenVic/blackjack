
$LOAD_PATH << '../lib'
require_relative '../lib/player'
require_relative '../lib/shoe'

require 'minitest/spec'
require 'minitest/autorun'

describe Player do
	it "should reset hand" do
		player = Player.new
		shoe = Shoe.new(1)
		player.hit(shoe.pop)
		player.new_hand
		player.hand.must_be_empty
		player.points.size.must_equal(1)
		player.points.first.must_equal(0)
	end

	it "should add points correctly" do
		player = Player.new
        shoe = Shoe.new(1)
		card = shoe.pop
		player.hit(card)
		correct_points = Array.new
		correct_points << card.points
		player.points.must_equal(correct_points)
	end

	it "should recognize blackjack" do
		player = Player.new
		player.hit(BlackjackCard.new(CardSuit::SPADE, BlackjackCardValue::ACE["rank"], BlackjackCardValue::ACE["points"]))
		player.hit(BlackjackCard.new(CardSuit::SPADE, BlackjackCardValue::KING["rank"], BlackjackCardValue::KING["points"]))
		player.blackjack?.must_equal(true)
	end

	it "should recognize bust" do
		player = Player.new
        player.hit(BlackjackCard.new(CardSuit::SPADE, BlackjackCardValue::QUEEN["rank"], BlackjackCardValue::QUEEN["points"]))
        player.hit(BlackjackCard.new(CardSuit::SPADE, BlackjackCardValue::KING["rank"], BlackjackCardValue::KING["points"]))
        player.hit(BlackjackCard.new(CardSuit::SPADE, BlackjackCardValue::TWO["rank"], BlackjackCardValue::TWO["points"]))
        player.bust?.must_equal(true)

	end
end
