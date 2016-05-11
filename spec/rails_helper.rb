ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'factory_girl_rails'

Dir[Rails.root.join('spec','support','**', '*.rb')].each { |f| require f }

RSpec.configure do |config|

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.disable_monkey_patching!

  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
end