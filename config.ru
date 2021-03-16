require_relative 'config/environment'

map '/auth' do
  run Application
end
