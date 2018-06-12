def check_valid_word?(str)
    unless str.is_a?(String) then return false end
    if str[/[a-zA-Z]+/] == str
        return true
    end

    return false
end
