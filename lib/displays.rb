#############################################################################
#   A ruby module to model a Blackjack games prompts	                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

module Displays

    UNKNOWN     = "I misunderstood. Please enter a value between 1 and 4."
    HIT         = "You hit."
    STAND       = "You stood."
	SURRENDER   = "You surrendered."
    LEAVE       = "You left the table."

	def Displays.messages
        [UNKNOWN, HIT, STAND, SURRENDER, LEAVE]
    end

	# Print a divider composed of character determined by 'c'
	def divider(n, c)
		for i in 0..n
			print c
		end
		puts ""
	end

	# Get number of decks to load shoe with
    def get_decks
        print "How many decks shoe would you like to play with (restricted to 5 decks)? "
        while ((@decks = gets.chomp.to_i) > 5) or (@decks < 1) do
            print "Please restrict number of decks to between 1 and 5. "
        end
    end

	# Print game menu
    def print_menu
        divider(55, '#')
        show_hands(false)
        puts "1. Hit"
        puts "2. Stand"
        puts "3. Surrender"
        puts "4. Leave table"
        divider(55, '#')
    end

	# Display hands
    def show_hands(show_hole_card)
        divider(55, '-')
        @dealer.show_hand("Dealer's hand", (show_hole_card or @dealer.blackjack? or @player.blackjack?))
        @player.show_hand("Your hand")
        divider(55, '-')
    end

	# Get the betting amount
    def get_bet
        print "Enter bet amount (minimum $1, maximum $#{@player.chips.to_i}): "
        while !(1..@player.chips).cover?(bet = gets.chomp.to_i)
            print "Please enter a value between 1 and #{@player.chips.to_i}: "
        end
        return bet
    end
end
