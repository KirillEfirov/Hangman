class Computer
    def initialize
        @dictionary = Array.new
        @word
        @wrong_letters = Array.new
    end

    public
    def create_dictionary(file)
        @dictionary = read_content(file)
    end

    def choose_word
        @word = @dictionary.sample
    end

    def show_word
        puts @word
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
    def count_letters(word)

    end

    def display_word(word)

    end

    #if is_letter_true? returns true then insert the letter in a word
    def insert_right_letter(word)

    end

    def add_wrong_letter(letter)
    end

    def display_wrong_letters()

    end
end