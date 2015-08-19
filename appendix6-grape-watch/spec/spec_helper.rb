require_relative 'mocks/database'
require_relative 'mocks/mock_database_spec'
require 'watch'
require_relative 'v6/mocks/action'
RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end
