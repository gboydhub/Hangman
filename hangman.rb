def check_valid_word?(str)
    unless str.is_a?(String); return false end
    if str[/[a-zA-Z]+/] == str; return true end

    false
end

def check_valid_guess?(input)
    if check_valid_word?(input) && input.length == 1; return true end

    false
end

if defined?(ISTESTING); exit end

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