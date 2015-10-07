def list(nameables)
  return '' if nameables.nil? || nameables.empty?
  names = nameables.map { |nameable| nameable[:name] }
  names.one? ? names.first : "#{names[0...-1].join(', ')} & #{names.last}"
end
