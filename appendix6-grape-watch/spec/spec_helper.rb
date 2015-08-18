require_relative 'mocks/database'
require_relative 'mocks/mock_database_spec'
require 'watch'

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end
