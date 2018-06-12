require './tested_functions.rb'
require 'io/console'

puts "Welcome to Hangman"

gamerunning = true
while gamerunning do
    userinput = 0
    while !check_valid_word?(userinput) do
        print "Player 1[Executioner], choose a word: "
        userinput = gets.chomp
    end

    gameboard = userinput.split('')
    answerboard = userinput.split('')
    answerboard.each_with_index do |v, i|
        gameboard[i] = '_'
    end

    stickmanprogress = [' ', ' ', ' ', ' ', ' ', ' ']
    numberwrong = 0
    numbercorrect = 0
    
    playloop = true
    while playloop do
        system 'clear' or system 'cls'
        puts <<-GAME_BOARD
            _____________
            /  ___________\\
            | /      |                          
            ||       O                      #{gameboard}
            ||      /|\\
            ||      / \\
            ||===========
            ||
            ||
        ===========
        GAME_BOARD

        input = STDIN.getch
        wronganswer = false
        unless check_valid_guess?(input); wronganswer = true end
        if !wronganswer && answerboard.include?(input)
            answerboard.each_with_index do |c, i|
                if c == input; gameboard[i] = c.upcase end
                numbercorrect += 1
            end
        end

        if wronganswer
            numberwrong += 1
        end
        if numberwrong > 6
            playloop = false
        end
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