ISTESTING = true
require './hangman.rb'
require 'test/unit'

class TestHangmanGame < Test::Unit::TestCase
    def test_check_valid_word
        assert_true(check_valid_word('hello'))
        assert_false(check_valid_word(2))
    end
end
