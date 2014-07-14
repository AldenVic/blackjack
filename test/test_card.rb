
$LOAD_PATH << '../lib'
require_relative '../lib/card'
require_relative '../lib/blackjack_card_value'

require 'minitest/spec'
require 'minitest/autorun'

describe Card do
	it "should initialize correctly" do
		card = Card.new(CardSuit::SPADE, BlackjackCardValue::FIVE)
        card.rank.must_equal BlackjackCardValue::FIVE
		card.suit.must_equal CardSuit::SPADE
	end
end
