ISTESTING = true
require './hangman.rb'
require 'test/unit'

class TestHangmanGame < Test::Unit::TestCase
    def test_check_valid_word
        assert_true(check_valid_word?('hello'))
        assert_false(check_valid_word?(2))
        assert_false(check_valid_word?('h3i'))
        assert_false(check_valid_word?(' 32re'))
        assert_false(check_valid_word?('[]`12-039`]'))
        assert_false(check_valid_word?('\n\"2323 ><?>~!@'))
        assert_false(check_valid_word?('This is a sentence, actually.'))
    end

    def test_check_valid_guess
        assert_true(check_valid_guess?('a'))
        assert_false(check_valid_guess?('1'))
        assert_false(check_valid_guess?('hi'))
    end
end
