require_relative '../../spec_helper'

describe 'Database' do
  let(:database) {Watch::V4::Util::Database.new}
  let(:test_time) {Time.new(2013,2,2,2,1,1).to_i}

  describe "methods" do
    context "public" do
      it "get_watch default" do
        expect(database.get_watch("topic")[:time]).to eql(Time.now.to_i)
      end
      it "set_topic" do
        expect(database.set_topic(topic: "topic", time: test_time, num_req: 1)).to eql(true)
      end
      it "get_watch after set" do
        expect(database.get_watch("topic")[:time]).to eql(test_time)
      end
     end
  end
end

