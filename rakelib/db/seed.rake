# frozen_string_literal: true

namespace :db do
  desc 'Loads the seed data from db/seeds.rb'
  task :seed, %i[version] => :environment do |_t, args|
    require 'sequel/core'
    require 'sequel/extensions/seed'
    
    Sequel::Seed.setup :development
    Sequel.extension :seed

    Sequel.connect(Settings.db.to_hash) do |db|
      Sequel::Seeder.apply(db, File.expand_path('../../db/seeds', __dir__))
    end
  end
end
