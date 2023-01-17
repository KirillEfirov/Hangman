require_relative "Computer.rb"
require_relative "Player.rb"
require_relative "Rules"
require_relative "Game.rb"
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
  p computer.get_guessed_word                                   #Don't forget to remove it from player later
  computer.create_filled_word
  print "Guessed word: "
  computer.display_filled_word

  puts

  game(computer, player)

when "2"
  data_in_yaml = String.new

  print "Enter file name to load the game(without extension): "
  filename = gets.chomp!
  puts

  if File.exist?("#{filename}.yaml")
    File.open("#{filename}.yaml", "r") do |file|
      data_in_yaml = file.read
    end

    deserialized_data = Game.from_yaml(data_in_yaml)

    player = deserialized_data[0]
    computer = deserialized_data[1]

    game(computer, player, filename)

  else 
    puts "File is not found"
    exit
  end
else
  exit
end

def game(computer, player, filename = "")
  puts "-" * 80
  puts "If you want to save a current game type 'save' at any moment"
  puts "-" * 80

  until computer.get_wrong_letters.size == 7 do

    print "Try to guess letter or save a game: "
  
    player.guess_letter

    if player.get_guesses.last == "save"
       player.get_guesses.pop()                                   #pop last elem in order not to save the word 'save' in player's attempts 

      game = Game.new(player, computer)

      print "Enter file name to save the game(without extension): "
      filename = gets.chomp!
      puts

      File.open("#{filename}.yaml", "w") do |file| 
        file.write(game.to_yaml)
      end
      exit
    else
      last_guess = player.get_guesses.last

      if computer.is_letter_true?(last_guess)
        puts "Letter true"
        computer.insert_right_letter(last_guess)
        computer.display_filled_word
        puts

        unless computer.is_player_win?
          puts "You cracked the word"
          File.delete("#{filename}.yaml") if File.exist?("#{filename}.yaml")
          exit
        end
      else 
        puts "Letter false"
        computer.add_wrong_letter(last_guess)
      end

    end
  end

  p "Better luck next time"
  File.delete("#{filename}.yaml") if File.exist?("#{filename}.yaml")
end