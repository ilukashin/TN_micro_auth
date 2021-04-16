# frozen_string_literal: true

task :settings do
  ENV['RACK_ENV'] ||= 'development'
  require 'config'
  require_relative '../config/initializers/config'
end

task :environment do
  require_relative '../config/environment'
end
