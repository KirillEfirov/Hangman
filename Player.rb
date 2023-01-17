class Player
    def initialize
      @try = 0
      @guesses = Array.new
    end

    def guess_letter
      @try += 1
      @guesses.push(gets.chomp!)
    end

    def get_guesses
      @guesses
    end
end