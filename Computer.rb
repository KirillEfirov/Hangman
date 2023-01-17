class Computer
    def initialize
        @guessed_word = String.new
        @wrong_letters = Array.new
        @filled_word = Array.new
    end

    public
    def choose_word(file)
        @guessed_word = File.open(file, "r") do |content|
            content.readlines.sample
        end
    end

    def get_guessed_word
       @guessed_word 
    end

    def show_dictionary
        puts @dictionary
    end

    public
    def create_filled_word
        @filled_word = Array.new(count_letters(@guessed_word) - 1, "_")
    end

    def display_filled_word()
        print "Guessed word: "
        @filled_word.each { |letter| print letter + " " }
        puts
    end

    private
    def count_letters(word)
        word.size
    end

    #if is_letter_true? returns true then insert the letter in a word
    public
    def insert_right_letter(word)
    end

    def add_wrong_letter(letter)
        @wrong_letters.push(letter)
    end

    def display_wrong_letters()
    end

    #private
    def is_letter_true?(letter)
        @guessed_word.include? letter
    end
end