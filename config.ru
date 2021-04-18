# frozen_string_literal: true

require_relative 'config/environment'

use Rack::RequestId
use Rack::Ougai::LogRequests, Application.logger

run Rack::URLMap.new(
  '/v1/user' => UserRoutes,
  '/v1/login' => UserSessionRoutes
)
