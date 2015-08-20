require_relative '../spec_helper'

describe "V6" do
  describe "ActionDb" do
    let(:action) {Watch::V6::Util::ActionDb.new}
    let(:watch) { {topic:"uno",time:233341,num_req:1} }

    describe "Check interface" do
      it "action role" do
        extend Watch::V6::Test::ActionRole
        test_interface(action)
      end
    end

    describe "Basic methods" do
      it "#initialize"do
        expect(action.db_conector.class).to eql(Watch::V6::Util::DbConector)
      end
      it "#get_watch" do
        expect(action.get_watch("no_exist").time).to eql(Time.now.to_i)
      end
      it "#set_topic" do
        expect(action.set_topic(watch)).to eql(true)
      end
    end
    describe "System" do
      it "#get_watch after set" do
        expect(action.get_watch(watch[:topic]).time).to eql(watch[:time])
      end
    end
  end
end


