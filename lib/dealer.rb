#############################################################################
#   A ruby class to model a Blackjack dealer			                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

require 'shoe'
require 'blackjack_hand'

class Dealer 
	
	include BlackjackHand

	def load_shoe(n)
		@shoe = Shoe.new(n)
	end

	def deal?
		@shoe.deal?
	end

	def deal_card
		@shoe.pop
	end
	
	def hit?
		if bust? or @points.last > 16
			return false
		end
		return true
	end

	def hit
		super(@shoe.pop)
	end

	def complete_hand
        while hit? do
            hit
        end
	end

	# Displays hand based
	def show_hand(identifier_message, show_hole_card)
		puts identifier_message + ": "
	    @hand.each_with_index do |card, index|
			if (!show_hole_card and index == 1)
				printf "%11s", "[X X] " 
				next
			end
			printf "%11s", "[#{card.suit} #{card.rank}] "
        end
		puts ""
		if show_hole_card
			puts "Points: #{@points}"
		end
	end
end
