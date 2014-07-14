#############################################################################
#   A ruby class to model a Blackjack player			                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

require 'blackjack_card'
require 'blackjack_hand'

class Player

	include BlackjackHand

	attr_reader :chips 

    def initialize(chips)
		super()
		@chips	= chips
	end

	def bet?
		@chips > 0.00
	end

	def winnings(c)
		@chips += c
	end

	def bet(c)
		@chips -= c
	end

end
