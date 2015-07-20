#!/usr/bin/ruby

require "librarian"

RSpec.configure do |c|
  c.color = true
end

describe Librarian do
  subject { Librarian.new }
  let(:sentence) { "El principito" }
  let(:book_titles) { ["Learning Ruby", "Learning Java", "Objects"] }

  describe "#order" do
    context "Sorting Books" do

      it "Many books" do
        expect(subject.orderBooks("El principito", "Game of Thrones")).to eql([sentence, "Game of Thrones"])
      end
      it "Other sort" do
        expect(Librarian.new.orderBooks("El principito", "Game of Thrones") {|array| array.sort() {|x| x.length}}).to eql(["Game of Thrones", "El principito"])
      end
    end
  end

  describe "#sayHi" do
    context "Say Hi" do
      it "Nothing to say" do
        expect(Librarian.new.sayHi({})).to match(/Hi Maria/)
      end
      it "Nothing to say" do
        expect(Librarian.new.sayHi("Pepe","Juan",{})).to eql("Hi Pepe and friends")
      end
    end
    context "Say Bye" do
      it "Say bye to Pepe" do
        expect(Librarian.new.sayHi("Pepe",{good_nigth: "Bye"})).to eql("Bye Pepe")
      end
    end
  end

  describe "#search_book" do
    context "Search by name" do
      it "Just the name" do
        a = subject
        a.orderBooks(*book_titles)
        expect(a.search_book("Maria",name: /earn/).to_s).to match(/Java/)
      end
      it "Name and date" do
        a = subject
        a.orderBooks(*book_titles)
        %x{date}.match(/.* (.*):(.*):(.*) .*/)
        expect(a.search_book("Maria",hour: $1.to_i,name: /earn/).to_s).to match(/Java/)
      end
    end
  end
end

