#!/usr/bin/ruby.rb

require "user"

RSpec.configure do |c|
    c.color = true
      c.formatter = 'documentation'
end

describe "User" do

  describe "#to_s" do
    let(:router1) {Router.new}
    context "Create User" do
      it "New user" do
        expect(User.new("Carlos","234:125:12:14").to_s).to eql("Name:Carlos   Mac:234:125:12:14")
      end
    end
  end

end

