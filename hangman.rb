def check_valid_word?(str)
    unless str.is_a?(String) then return false end
    if str[/[a-zA-Z]+/] == str
        return true
    end

    return false
end

def check_valid_guess?(input)
    check_valid_word?(input)
end