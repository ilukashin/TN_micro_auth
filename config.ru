require_relative 'config/environment'

map '/auth' do
  run Application
end

map '/user' do
  run UserRoutes
end

map '/login' do
  run UserSessionRoutes
end
