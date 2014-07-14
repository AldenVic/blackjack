#############################################################################
#   A ruby class to model the Blackjack game			                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

require 'dealer'
require 'player'
require 'displays'

class Blackjack

	include Displays

	# Determine winner
	def winner
		d_points = @dealer.points
		p_points = @player.points

		if d_points.empty?
			return @player
		elsif p_points.empty?
			return @dealer
		elsif d_points.max == p_points.max
			return nil
		else			
			return (d_points.max < p_points.max ? @player : @dealer)
		end
	end

	# Start dealing
	def start_deal
		@player.hit(@dealer.deal_card)
		@dealer.hit
		@player.hit(@dealer.deal_card)
        @dealer.hit
	end

	def blackjack?
        @player.blackjack? or @dealer.blackjack?
	end
	
	# Determines and displays the winner
	def reveal_winner(odds)
		if winner.nil?
            puts "Push."
            @player.winnings(@bet)
        elsif winner === @dealer
            puts "You lose."
        else
            puts "You win."
            @player.winnings(odds * @bet)
        end
	end

	def start_game(purse)
		@dealer = Dealer.new
		@player = Player.new(purse)
		get_decks
		@dealer.load_shoe(@decks)
		
		msgs = Displays.messages

		while @player.bet? and @dealer.deal?
			divider(55, '/')
			@player.bet(@bet = get_bet)
			@player.new_hand
			@dealer.new_hand
			start_deal
			print_menu
			if blackjack?
				reveal_winner(2.5)
				next
			end
			while (@action = gets.chomp.to_i) != 4 do
				puts msgs[(1..4).cover?(@action) ? @action : 4 ]
				case @action
				when 1 # HIT
					@player.hit(@dealer.deal_card)
					if @player.bust?
                        show_hands(false)
						puts "You've gone bust!"
						break
					elsif @player.stand?
						@dealer.complete_hand
						show_hands(true)
						reveal_winner(2)
						break
					end
				when 2 # STAND
					@player.stand
					@dealer.complete_hand
					show_hands(true)
					reveal_winner(2)
					break
				when 3 # SURRENDER
					break
				end
				print_menu
			end
	        if @action == 4
		        puts msgs[4]
			    puts "Your purse: #{@player.chips}"
			    break
			end
		end

		# Determine reasons for exit from game
		if !@player.bet?
			puts "You're out of chips."
		elsif !@dealer.deal?
			puts "Shoe below minimum."
			puts "Your purse: #{@player.chips}"
		end
	
		# Tell caller what was the last action and player's purse	
		[@action, @player.chips]
	end
end
