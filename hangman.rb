require './tested_functions.rb'

puts "Welcome to Hangman"

gamerunning = true
while gamerunning do
    userinput = 0
    while !check_valid_word?(userinput) do
        print "Player 1[Executioner], choose a word: "
        userinput = gets.chomp
    end

    puts "Selected valid word!"
end