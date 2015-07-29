#!/usr/bin/ruby

require "untrusted"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe "Untrusted" do
  describe "#run_raise" do
    context "run a block" do
      it "open file" do
        expect{Untrusted.new.run_raise { File.open("name","w") {|f| f.print} }}.to raise_error(SecurityError)
      end
    end
  end
  describe "#run_untrust" do
    context "run a block" do
      it "open file" do
        expect{Untrusted.new.run_untrust("pwd")}.to raise_error(SecurityError)
      end
    end
  end
end

