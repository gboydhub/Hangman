ISTESTING = true
require "./hangman.rb"
require "test/unit"

class Test_hangman_game < Test::Unit::TestCase
    def test_check_valid_word
        assert_true(check_valid_word("hello"))
        assert_false(check_valid_word(2))
    end
end