require_relative '../spec_helper'

describe "V6" do
  describe "DbConector" do
    let(:conector) {Watch::V6::Util::DbConector.new}
    let(:watch_values) {{topic: "topic",time: 2000, num_req: 1}}
    let(:watch) {OpenStruct.new(watch_values)}

    describe "Interface" do
      it "Database Role" do
        extend Watch::V6::Test::DatabaseRole
        test_interface(conector)
      end
    end
    describe "Basic methods" do
      it "#update_database" do
        expect(conector.update_database(watch).class).to eql(Fixnum)
      end
      it "#query" do
        expect(conector.query("topic").time).to eql(2000)
      end
      it "#delete" do
        conector.delete("topic")
        expect(conector.query("topic")).to eql(nil)
      end
    end
  end
end

