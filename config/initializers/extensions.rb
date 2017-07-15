Dir[Rails.root.join('lib', '**', '*.rb')].each do |extension|
  require extension
end
