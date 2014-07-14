
$LOAD_PATH << '../lib'
require_relative '../lib/deck'

require 'minitest/spec'
require 'minitest/autorun'

describe Deck do
	it "should shuffle cards when asked" do
		unshuffled = Deck.new
		shuffled = Deck.new
		shuffled.shuffle
		equal = 0
		for i in 0..51
			equal += (((unshuffled.cards[i].rank == shuffled.cards[i].rank) and (unshuffled.cards[i].suit == shuffled.cards[i].suit)) ? 1 : 0)
		end
		equal.wont_equal(52)
	end
end
