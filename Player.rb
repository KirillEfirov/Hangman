require "yaml"
#Number of attempts, all the letters should be serialized

class Player
    def initialize
        @try = 0
        @guesses = Array.new
    end

    def guess_letter
        @try += 1
        @guesses.push(gets.chomp!)
    end

    def guess_word
    end

    def save_game?
    end
end