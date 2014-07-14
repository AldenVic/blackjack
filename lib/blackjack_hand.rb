#############################################################################
#   A ruby class to model a player's hand in Blackjack	                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################



module BlackjackHand
    attr_reader :points, :hand, :stand

    def initialize
        @hand   = []
        @points = [0]
        @stand  = false
    end

	# Resets hand
    def new_hand
        @hand   = []
        @points = [0]
        @stand  = false
    end

	# Displays hand
    def show_hand(identifier_message)
        puts identifier_message + ": "
        @hand.each do |card|
            printf "%11s", "[#{card.suit} #{card.rank}] "
        end
        puts "\nPoints: #{@points}"
    end

	# Updates points based on new card
    def add_to_points(card)
        if card.points.kind_of?(Array)
            h_points = points.dup
            @points.map! { |point|
                 point + 1
            }
            h_points.map! { |h_point|
                h_point + 11
            }
            (@points << h_points).flatten!
            @points.uniq!
            @points.sort!
        else
            @points.map! { |point|
                point + card.points
            }
        end
        @points.select! { |p| p < 22}
		if @points.max == 21
			stand
		end	
    end

    def blackjack?
        (@hand.length == 2 and @points.include?(21))
    end

    def bust?
        @points.empty?
    end

    def hit?
        if !@stand and !bust?
            return true
        end
        return false
    end

    def hit(card)
        if hit? and !card.nil?
            @hand << card
            add_to_points(card)
        elsif card.nil?
            puts "No more cards in the shoe."
        elsif bust?
            puts "You've gone bust."
        else
            puts "Cannot hit. Already declared stand."
        end
    end

    def stand
        @stand = true
    end
	
	def stand?
		@stand
	end

end

