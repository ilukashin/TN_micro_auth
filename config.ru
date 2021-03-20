# frozen_string_literal: true

require_relative 'config/environment'

# map '/auth' do
#   run AuthRoutes
# end

# map '/user' do
#   run UserRoutes
# end

# map '/login' do
#   run UserSessionRoutes
# end

run Rack::URLMap.new(
  '/v1/auth' => AuthRoutes,
  '/v1/user' => UserRoutes,
  '/v1/login' => UserSessionRoutes
)
