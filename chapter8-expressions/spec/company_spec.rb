#!/usr/bin/ruby

require "company"

RSpec.configure do |c|
  c.color = true
  c.formatter = 'documentation'
end

describe Company do
  subject {Company.new("Juan","Pedro","Lola")}
  describe ".new" do
    context "Company with workers" do
      it "Three Workers" do
        expect(subject.workers.length).to eql(3)
      end
      it "Default Workers" do
        expect(Company.new().workers).to eql(["Maria","Pepe"])
      end
    end
  end

  describe ".[]" do
    context "Searching workers" do
      it "Looking for Pedro" do
        expect(subject[1]).to eql("Pedro")
      end
    end
  end

  describe ".workers_last_char_no_vocal" do
    context "Searching workers with no vocal" do
      it "Simple search" do
        expect(subject.workers_last_char_no_vocal[0]).to match(/Juan/)
      end
    end
  end

  describe ".workers_last_char_vocal" do
    context "Searching workers with vocal" do
      it "Simple search" do
        expect(subject.workers_last_char_vocal[0]).to match(/Pedro/)
      end
    end
  end

  describe ".define_work" do
    context "Adding some projects" do
      it "Add project Microservice" do
        expect(subject.define_work("Project Microservice")).to match("Microservice")
      end
    end
    context "Adding invalid task" do
      it "Invalid task" do
        expect(subject.define_work("Invalid task")).to eql("Invalid task")
      end
    end
  end
end
