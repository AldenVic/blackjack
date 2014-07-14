#############################################################################
#   A ruby class to model a playing card deck			                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

require 'blackjack_card'

class Deck
	attr_reader :cards
	
	def initialize 
		@cards = Array.new
		suit_enum = CardSuit.enum 
		suit_enum.each do |suit|
			value_enum = BlackjackCardValue.enum
			value_enum.each do |value|
				card = BlackjackCard.new(suit, value["rank"], value["points"])
				@cards << card
			end
		end
	end	

	def shuffle
		@cards = @cards.shuffle
	end
end
