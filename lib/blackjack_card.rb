#############################################################################
#	A ruby class to model the Blackjack card's attributes					#
#	Author		: Alden Fernandes, 2014										#
#	Last Edit	: 7/13/2014													#
#############################################################################
require 'card'
require 'blackjack_card_value'

class BlackjackCard < Card
	
	extend BlackjackCardValue

	attr_reader :points
	
	def initialize(suit, rank, points)
		@points = points
		super(suit, rank)
	end
end
