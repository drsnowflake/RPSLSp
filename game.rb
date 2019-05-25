puts "Hi, welcome to RPSLSp"
puts 

numToText = %w{Rock Paper Scissors Lizard Spock}
playerWins = 0
computerWins = 0

loop do

computerThrow = rand(1..5)
puts "Choose your weapon - Rock (1), Paper (2), Scissors (3), Lizard (4), Spock (5): "
playerThrow = gets.to_i

# loop for valid input
while !playerThrow.between?(1,5) do
 	puts "Something doesn't seem quite right, please check the choices and try again."
 	playerThrow = gets.to_i
end

def victoryConditions(result)
  case result
  when '32'
    puts "Scissors cuts Paper!"
  when '21'
    puts "Paper covers Rock!"
  when '14'
    puts "Rock crushes Lizard!"
  when '45'
    puts "Lizard poisons Spock!"
  when '53'
    puts "Spock smashes Scissors!"
  when '34'
    puts "Scissors decapitates Lizard!"
  when '42'
    puts "Lizard eats Paper!"
  when '25'
    puts "Paper disproves Spock!"
  when '51'
    puts "Spock vaporizes Rock!"
  when '13'
    puts "Rock crushes Scissors!"
  end
end

puts
puts "You threw #{numToText[playerThrow-1]}, computer threw #{numToText[computerThrow-1]}"

# victory conditions
if playerThrow == computerThrow
	puts "Both players threw #{numToText[playerThrow-1]}. It's a draw!"

elsif (playerThrow == 3 && computerThrow == 2) || (playerThrow == 2 && computerThrow == 1) || 
	(playerThrow == 1 && computerThrow == 4) || (playerThrow == 4 && computerThrow == 5) || 
	(playerThrow == 5 && computerThrow == 3) || (playerThrow == 3 && computerThrow == 4) || 
	(playerThrow == 4 && computerThrow == 2) || (playerThrow == 2 && computerThrow == 5) || 
	(playerThrow == 5 && computerThrow == 1) || (playerThrow == 1 && computerThrow == 3)
	
	winner = playerThrow.to_s + computerThrow.to_s
	victoryConditions(winner)
	puts
	playerWins += 1
	puts "You win! :D"

else
	winner = computerThrow.to_s + playerThrow.to_s
	victoryConditions(winner)
	puts
	computerWins += 1
	puts "Computer wins :("

end


# repeat round // break
puts
puts "Another round? (y/n)"
playAgain = gets.chomp.downcase

while !(playAgain == 'y' || playAgain == 'n') do
 	puts "hmm, did you want to play again? (y/n)"
 	playAgain = gets.chomp.downcase
end

if playAgain == 'y'
	system "clear" or system "cls"
end

puts


break if playAgain == 'n'

end

puts "Congratulations! You beat the computer #{playerWins} rounds to #{computerWins}" if playerWins > computerWins
puts "The computer beat you #{computerWins} rounds to #{playerWins}. Better luck next time! " if computerWins > playerWins
puts "WOW! A draw in games! Both you and the computer won #{playerWins} rounds"	 if playerWins == computerWins
puts
puts "Thanks for playing!"