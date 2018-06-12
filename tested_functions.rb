def check_valid_word?(str)
  unless str.is_a?(String); return false end
  if str[/[a-zA-Z]+/] == str; return true end

  false
end

def check_valid_guess?(input)
  if check_valid_word?(input) && input.length == 1; return true end

  false
end