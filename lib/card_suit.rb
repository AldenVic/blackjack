#############################################################################
#   A ruby module to model a playing card's suit		                    #
#   Author      : Alden Fernandes, 2014                                     #
#   Last Edit   : 7/13/2014                                                 #
#############################################################################
module CardSuit
	SPADE	= "♠"
	HEART	= "♥"
	DIAMOND = "♦"
	CLUB	= "♣"

	def CardSuit.enum
		enum = [SPADE, HEART, DIAMOND, CLUB]
	end
end
