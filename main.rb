require_relative "Computer.rb"
require_relative "Player.rb"
require_relative "Rules"
require "yaml"

rules = Rules.new
rules.show_rules

puts "Hangman. Would you like to: 1) Start a new game"
puts "                            2) Load a game"


case gets.chomp!
when "1"
  computer = Computer.new
  player = Player.new

  computer.choose_word("words.txt")
  p computer.get_guessed_word           #Don't forget to remove it from player later
  computer.create_filled_word
  print "Guessed word: "
  computer.display_filled_word

  puts

  until computer.get_wrong_letters.size == 7 do
    print "Try to guess letter: "
    player.guess_letter
    last_guess = player.get_guesses.last

    if computer.is_letter_true?(last_guess)
      puts "Letter true"
      computer.insert_right_letter(last_guess)
      computer.display_filled_word
      puts

      unless computer.is_player_win?
        puts "You cracked the word"
        exit
      end
    else 
      puts "Letter false"
      computer.add_wrong_letter(last_guess)
    end
  end

  puts "Better luck next time"


  #File.open("player.yaml", "a") { |file| file.write(YAML::dump(player)) }
when "2"
  exit
else
  exit
end