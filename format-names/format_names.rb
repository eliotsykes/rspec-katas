def list(nameables)
  return '' if nameables.nil? || nameables.empty?
  nameables.each_with_index.reduce('') do |memo, (nameable, index)|
    if index == 0
      separator = ''
    elsif index == (nameables.length-1)
      separator = ' & '
    else
      separator = ', '
    end
    memo << separator << nameable[:name]
  end
end
