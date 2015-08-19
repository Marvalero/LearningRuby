require_relative 'database'
require 'ostruct'

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "Mocks" do
  include Mocks

  let(:fake_api) { OpenStruct.new(database: Mocks::DatabaseMock.new) }

  describe "Mocks" do
    let(:mock_database) {Mocks::DatabaseMock.new}
    let(:test_time) {Time.new(2004,3,2,4,2,2).to_i}

    context "Use case 1" do
      it "Changing time" do
        mock_database.time= test_time
        expect(fake_api.database.get_watch("topic").time).to match(test_time)
      end
    end

  end
end
