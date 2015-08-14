require_relative 'database'

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "Mocks" do
  include Mocks

  class FakeApi
    include Mocks
    def database
      @@database ||= Mocks::DatabaseMock.new
    end
  end

  describe "Mocks" do
    let(:fake_api) {FakeApi.new}
    let(:mock_database) {Mocks::DatabaseMock.new}
    let(:test_time) {Time.new(2004,3,2,4,2,2).to_i}

    context "Use case 1" do
      it "Changing time" do
        mock_database.time= test_time
        expect(fake_api.database.get_watch(self).time).to match(test_time)
      end
     end

  end
end
