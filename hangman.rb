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
    lostgame = false
    while playloop do
        system 'clear' or system 'cls'
        puts <<-GAME_BOARD
             _____________
            /  ___________\\
            | /      |                          
            ||       O                      #{gameboard.join(' ')}
            ||      /|\\
            ||      / \\
            ||===========
            ||
            ||
        ===========
        GAME_BOARD

        puts "\nGuesses left: #{6-numberwrong}"
        print "Pick a letter: "
        input = STDIN.getch
        wronganswer = false
        unless check_valid_guess?(input); wronganswer = true end
        if !wronganswer && answerboard.include?(input)
            answerboard.each_with_index do |c, i|
                if c == input && gameboard[i] != c.upcase
                    gameboard[i] = c.upcase
                    numbercorrect += 1
                end
            end
        else
            numberwrong += 1
        end
        if numberwrong >= 6
            playloop = false
            lostgame = true
        end
        if numbercorrect == answerboard.length
            playloop = false
        end
        sleep 0.5
    end

    if lostgame
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
        sleep 2
        system 'clear' or system 'cls'
        puts <<-PRETTY_ART
             _____________
            /  ___________\\
            | /      |
            ||       |      YOU LOSE!      
            ||       O
            ||      /|\\
            ||====# / \\
            ||    #
            ||    #
        ===========
        PRETTY_ART
    else
        system 'clear' or system 'cls'
        puts <<-PRETTY_ART
             _____________
            /  ___________\\
            | /      |
            ||      
            ||      
            ||                        YOU WIN!
            ||===========       \\O/
            ||                   |
            ||                  / \\   
        ==============================
        PRETTY_ART
    end
    puts 'Press \'P\' to play again!'
    if STDIN.getch.downcase != 'p' then gamerunning = false end
end