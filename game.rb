# enable (true) or disable (false) tension building features
build_tension_mode = true

# welcome and setup
puts 'Hi, welcome to RPSLSp'

replay = %w[y n]
num_to_text = %w[Rock Paper Scissors Lizard Spock]
player_wins = 0
computer_wins = 0

# victory text lines
victory_conditions = {
  '32' => 'Scissors cuts Paper!',
  '21' => 'Paper covers Rock!',
  '14' => 'Rock crushes Lizard!',
  '45' => 'Lizard poisons Spock!',
  '53' => 'Spock smashes Scissors!',
  '34' => 'Scissors decapitates Lizard!',
  '42' => 'Lizard eats Paper!',
  '25' => 'Paper disproves Spock!',
  '51' => 'Spock vaporizes Rock!',
  '13' => 'Rock crushes Scissors!'
}

# game start loop
loop do
  computer_throw = rand(1..5)
  puts
  puts 'Choose your weapon - Rock (1), Paper (2), Scissors (3), Lizard (4), Spock (5): '
  player_throw = gets.to_i

  # check for valid player input
  until player_throw.between?(1, 5)
    puts
    puts 'Something doesn\'t seem quite right, please check the choices and try again.'
    player_throw = gets.to_i
  end

  # build the tension
  counter = 3
  if build_tension_mode
    loop do
      system 'clear'
      puts 'Throwing in'
      puts counter
      sleep(1)
      counter -= 1
      break if counter.zero?
    end
  end

  # show the throws
  puts
  print "You threw #{num_to_text[player_throw - 1]}, computer threw... "
  sleep(1) if build_tension_mode
  puts num_to_text[computer_throw - 1]
  sleep(1) if build_tension_mode

  # results of match
  if player_throw == computer_throw
    puts
    puts "Both players threw #{num_to_text[player_throw - 1]}. It's a draw!"
  elsif (player_throw == 3 && computer_throw == 2) ||
        (player_throw == 2 && computer_throw == 1) ||
        (player_throw == 1 && computer_throw == 4) ||
        (player_throw == 4 && computer_throw == 5) ||
        (player_throw == 5 && computer_throw == 3) ||
        (player_throw == 3 && computer_throw == 4) ||
        (player_throw == 4 && computer_throw == 2) ||
        (player_throw == 2 && computer_throw == 5) ||
        (player_throw == 5 && computer_throw == 1) ||
        (player_throw == 1 && computer_throw == 3)
    winner = player_throw.to_s + computer_throw.to_s
    puts
    puts victory_conditions.fetch(winner)
    player_wins += 1
    puts
    sleep(1) if build_tension_mode
    puts 'You win! :D'
  else
    winner = computer_throw.to_s + player_throw.to_s
    puts
    puts victory_conditions.fetch(winner)
    computer_wins += 1
    puts
    sleep(1) if build_tension_mode
    puts 'Computer wins :('
  end

  # repeat round // break
  sleep(1) if build_tension_mode
  puts
  puts 'Another round? (y/n)'
  play_again = gets.chomp.downcase

  until replay.include?(play_again)
    puts
    puts 'hmm, did you want to play again? (y/n)'
    play_again = gets.chomp.downcase
  end

  if play_again == 'y'
    system 'clear' if build_tension_mode
  end

  break if play_again == 'n'
end

# exit messages
puts
puts "Congratulations! You beat the computer #{player_wins} rounds to #{computer_wins}" if player_wins > computer_wins
puts "The computer beat you #{computer_wins} rounds to #{player_wins}. Better luck next time!" if computer_wins > player_wins
puts "WOW! A draw! Both you and the computer won #{player_wins} rounds" if player_wins == computer_wins
puts
puts 'Thanks for playing! Press return to exit'
gets
