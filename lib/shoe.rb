#############################################################################
#   A ruby class to model a playing card shoe			                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

require 'deck'

class Shoe

    def initialize(n)
		if !n.between?(1, 5)
			raise 'Please limit your decks to 5!'
		end
		@cards = Array.new
		n.times do
			deck = Deck.new
			deck.cards.each do |card|
				@cards << card
			end
		end	
		shuffle
	end

	def pop
		@cards.pop	
	end

    def shuffle
        @cards.shuffle!
    end

	def deal?
		@cards.length > 15
	end

end

