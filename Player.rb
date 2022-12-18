class Player
    def initialize
        @try = 0
        @attempt
        @guesses = Array.new
    end

    def guess_letter
        @attempt = gets.chomp!
        @try += 1
        @guesses.push(@attempt)
    end

    def guess_word
    end

    def save_game?
    end
end