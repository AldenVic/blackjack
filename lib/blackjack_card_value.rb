#############################################################################
#   A ruby module to model the Blackjack card's point system                #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################

module BlackjackCardValue
	
	# Card mappings:
	TWO		= Hash[ "rank" => "2", "points" => 2]
	THREE	= Hash[ "rank" => "3", "points" => 3]
	FOUR	= Hash[ "rank" => "4", "points" => 4]
	FIVE	= Hash[ "rank" => "5", "points" => 5]
	SIX		= Hash[ "rank" => "6", "points" => 6]
	SEVEN	= Hash[ "rank" => "7", "points" => 7]
	EIGHT	= Hash[ "rank" => "8", "points" => 8]
	NINE	= Hash[ "rank" => "9", "points" => 9]
	TEN		= Hash[ "rank" => "10", "points" => 10]
	JACK	= Hash[ "rank" => "J", "points" => 10]
	QUEEN	= Hash[ "rank" => "Q", "points" => 10]
	KING	= Hash[ "rank" => "K", "points" => 10]
	ACE		= Hash[ "rank" => "A", "points" => [1, 11]]

	def BlackjackCardValue.enum
		enum = [TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING, ACE].each
	end
	
end
