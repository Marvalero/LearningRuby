require_relative '../../spec_helper'

describe "Mocks" do
  include Mocks

  class FakeApi
    include Mocks
    def database
      @@database ||= Mocks::V6::ActionMock.new
    end
  end

  describe "Mocks" do
    let(:fake_api) {FakeApi.new}
    let(:mock_database) {Mocks::V6::ActionMock.new}
    let(:test_time) {Time.new(2004,3,2,4,2,2).to_i}

    context "Use case 1" do
      it "Changing time" do
        mock_database.time= test_time
        expect(fake_api.database.get_watch(self).time).to match(test_time)
      end
     end

  end
end
