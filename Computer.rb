class Computer
    def initialize
        @dictionary = Array.new
        @guessedWord = String.new
        @wrongLetters = Array.new
        @filledWord = Array.new
    end

    public
    def create_dictionary(file)
        @dictionary = read_content(file)
    end

    def choose_word
        @guessedWord = @dictionary.sample
    end

    def show_dictionary
        puts @dictionary
    end

    private
    def read_content(file)
        File.open(file, "r") do |content|
            content.readlines
        end
    end

    private
    def is_letter_true?(letter)

    end

    public
    def create_filled_word
        @filledWord = Array.new(count_letters(@guessedWord), "_")
    end

    def display_filled_word()
        print "Guessed word: "
        @filledWord.each { |letter| print letter + " " }
        puts
    end

    private
    def count_letters(word)
        word.size
    end

    #if is_letter_true? returns true then insert the letter in a word
    def insert_right_letter(word)

    end

    def add_wrong_letter(letter)
    end

    def display_wrong_letters()

    end
end