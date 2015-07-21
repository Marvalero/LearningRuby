#!/usr/bin/ruby

require "execution"

RSpec.configure do |c|
      c.color = true
            c.formatter = 'documentation'
end

describe Execution do
  subject {Execution.new}
  let(:webpage) {"http://www.google.com/search?q=doughnuts"}
  let(:webpages) {["http://www.google.com/search?q=doughnuts", "http://www.google.com/search?q=ruby", "http://www.google.com/search?q=horses"]}

  describe "#create_fiber" do
    context "Searching images" do
      it "One page" do
        expect(subject.create_fiber(webpage)).to eql(["Images for doughnuts"])
      end
      it "Some pages" do
        expect(subject.create_fiber(*webpages).to_s).to match(/doughnuts.*horses/)
      end
     end
  end
  describe "#next_fiber_h3" do
    context "Searching fibers" do
      it "No fiber created" do
        expect(subject.next_fiber_h3).to eql(nil)
      end
    end
  end
  describe "#create_threads" do
    context "Searching images" do
      it "One page" do
        expect(subject.create_threads(webpage)).to eql(["Images for doughnuts"])
      end
      it "Some pages" do
        expect(subject.create_threads(*webpages).sort.inspect.to_s).to match(/doughnuts.*horses/)
      end
    end
  end
  describe "#next_thread_h3" do
    context "Searching h3 threads" do
      it "No thread created" do
        expect(subject.next_thread_h3).to eql(nil)
      end
    end
  end

  describe "#create_processes_write" do
    context "Writing files" do
      it "Write a file" do
        expect(subject.create_processes_write("http://www.google.com/search?q=doughnuts","name.txt")).to eql(":D")
      end
    end
  end
  describe "#delete_file" do
    context "Deleting files" do
      it "Delete a file" do
        expect(subject.delete_file("name.txt")).to eql("Deleted")
      end
       it "Delete a non-existence file" do
        expect(subject.delete_file("name.txt")).to eql("Error")
      end
    end
  end
end
