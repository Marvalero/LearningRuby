#!/usr/bin/ruby

require "librarian"

RSpec.configure do |c|
  c.color = true
end

describe Librarian do

  describe "#order" do
    context "Sorting Books" do
      it "Many books" do
        expect(Librarian.new.orderBooks("El principito", "Game of Thrones")).to eql(["El principito", "Game of Thrones"])
      end
      it "Other sort" do
        expect(Librarian.new.orderBooks("El principito", "Game of Thrones") {|array| array.sort() {|x| x.length}}).to eql(["Game of Thrones", "El principito"])
      end
    end
  end

  describe "#sayHi" do
    context "Say Hi" do
      it "Nothing to say" do
        expect(Librarian.new.sayHi({})).to eql("Hi Maria")
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

end

