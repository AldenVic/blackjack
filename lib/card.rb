#############################################################################
#   A ruby class to model a playing card's attributes	                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

require 'card_suit'

class Card
	include CardSuit
	attr_reader :suit, :rank

	def initialize(suit, rank)
		@suit = suit
		@rank = rank
	end
end
	
