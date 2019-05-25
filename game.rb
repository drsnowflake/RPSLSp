# toggle sleep/pauses on(0) or off(1)
fastmode = 0

# welcome and setup
puts "Hi, welcome to RPSLSp"

numToText = %w{Rock Paper Scissors Lizard Spock}
playerWins = 0
computerWins = 0

# game start loop
loop do

computerThrow = rand(1..5)
puts
puts "Choose your weapon - Rock (1), Paper (2), Scissors (3), Lizard (4), Spock (5): "
playerThrow = gets.to_i


# check for valid input
while !playerThrow.between?(1,5) do
  puts
  puts "Something doesn't seem quite right, please check the choices and try again."
  playerThrow = gets.to_i
end


# victory text lines
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


# build the tension
counter = 3
if fastmode == 0
  loop do
    system "clear" or system "cls"
    puts "Throwing in"
    puts counter
    sleep (1)
    counter -= 1
    if counter == 0
      break
    end
  end
end

# show the throws
puts
puts "You threw #{numToText[playerThrow-1]}, computer threw #{numToText[computerThrow-1]}"
sleep (1) if fastmode == 0


# results of match
if playerThrow == computerThrow
  puts
  puts "Both players threw #{numToText[playerThrow-1]}. It's a draw!"
elsif (playerThrow == 3 && computerThrow == 2) || (playerThrow == 2 && computerThrow == 1) || 
	(playerThrow == 1 && computerThrow == 4) || (playerThrow == 4 && computerThrow == 5) || 
	(playerThrow == 5 && computerThrow == 3) || (playerThrow == 3 && computerThrow == 4) || 
	(playerThrow == 4 && computerThrow == 2) || (playerThrow == 2 && computerThrow == 5) || 
	(playerThrow == 5 && computerThrow == 1) || (playerThrow == 1 && computerThrow == 3)

  winner = playerThrow.to_s + computerThrow.to_s
  puts
  victoryConditions(winner)
  playerWins += 1
  puts
  sleep (1) if fastmode == 0
  puts "You win! :D"
else
  winner = computerThrow.to_s + playerThrow.to_s
  victoryConditions(winner)
  computerWins += 1
  puts
  sleep (1) if fastmode == 0
  puts "Computer wins :("
end


# repeat round // break
sleep (1) if fastmode == 0
puts
puts "Another round? (y/n)"
playAgain = gets.chomp.downcase

while !(playAgain == 'y' || playAgain == 'n') do
  puts
  puts "hmm, did you want to play again? (y/n)"
  playAgain = gets.chomp.downcase
end

if playAgain == 'y'
  system "clear" or system "cls"
end

break if playAgain == 'n'

end


# exit messages
puts
puts "Congratulations! You beat the computer #{playerWins} rounds to #{computerWins}" if playerWins > computerWins
puts "The computer beat you #{computerWins} rounds to #{playerWins}. Better luck next time! " if computerWins > playerWins
puts "WOW! A draw! Both you and the computer won #{playerWins} rounds" if playerWins == computerWins
puts
puts "Thanks for playing! Press return to exit"
gets