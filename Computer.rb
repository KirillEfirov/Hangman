require "yaml" #to save guessed word, wrong and right letters, number of missed attempts

class Computer
    def initialize
        @guessed_word = String.new
        @wrong_letters = Array.new
        @filled_word = Array.new
    end

    public
    def choose_word(file)
        @guessed_word = File.open(file, "r") { |content| content.readlines.sample }
    end

    def get_guessed_word
       @guessed_word 
    end

    def get_dictionary
        @dictionary
    end

    public
    def create_filled_word
        @filled_word = Array.new(count_letters(@guessed_word) - 1, "_")
    end

    def display_filled_word()
        @filled_word.each { |letter| print letter + " " }
    end

    private
    def count_letters(word)
        word.size
    end

    public
    def insert_right_letter(guessed_letter)
        @guessed_word.split("").each_with_index { |letter, ind| @filled_word[ind] = letter if letter == guessed_letter }
    end

    def add_wrong_letter(letter)
        @wrong_letters.push(letter)
    end

    def get_wrong_letters()
        @wrong_letters
    end

    #private
    def is_letter_true?(letter)
        @guessed_word.include? letter
    end
end