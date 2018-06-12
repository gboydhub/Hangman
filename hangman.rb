require './tested_functions.rb'

puts "Welcome to Hangman"

gamerunning = true
while gamerunning do
    userinput = 0
    while !check_valid_word?(userinput) do
        print "Player 1[Executioner], choose a word: "
        userinput = gets.chomp
    end

    system 'clear' or system 'cls'
    puts <<-PRETTY_ART
         _____________
        /  ___________\\
        | /      |
        ||       O
        ||      /|\\
        ||      / \\
        ||===========
        ||
        ||
    ===========
    PRETTY_ART
    sleep 2
    system 'clear' or system 'cls'
    puts <<-PRETTY_ART
         _____________
        /  ___________\\
        | /      |
        ||       O
        ||      /|\\
        ||      / \\
        ||====#
        ||    #
        ||    #
    ===========
    PRETTY_ART
    sleep 1
    system 'clear' or system 'cls'
    puts <<-PRETTY_ART
         _____________
        /  ___________\\
        | /      |
        ||       |
        ||       O
        ||      /|\\
        ||====# / \\
        ||    #
        ||    #
    ===========
    PRETTY_ART
    gamerunning = false
end