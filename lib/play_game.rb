###################################################
#			Blackjack game starter				  #
###################################################


$LOAD_PATH << '.'

require 'blackjack'

b = Blackjack.new
chips = 100

begin
	result = b.start_game(chips)
	chips = result[1]

	if result[0] != 4 and chips
		puts "Reset table [y/n]?"
		while !(['y', 'n', 'Y', 'N'].include?(answer = gets.chomp))
			puts "Reset table [y/n]?"
		end
		if answer == 'y'
			next
		else
			break
		end
	else
		break
	end

end while chips

