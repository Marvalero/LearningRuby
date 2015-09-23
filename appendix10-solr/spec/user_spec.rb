#!/usr/bin/ruby.rb

require "book"

RSpec.configure do |c|
    c.color = true
      c.formatter = 'documentation'
end

describe "Book" do

  describe "Sunspot" do
    let(:router1) {Router.new}

    def add_data
      Sunspot.index( king = Book.new( {
        :author     => 'Stephen King',
        :blurb      => 'Things get really weird out West',
        :edition    => 1,
        :isbn10     => '1234567890',
        :isbn13     => 'abcdef0123456',
        :price      => 12.99,
        :published_at => Time.now,
        :publisher  => 'Random Number House',
        :title      => 'The Dark Tower' } ) )

      Sunspot.index( reaper = Book.new( {
        :author     => 'Josh Bazell',
        :blurb      => 'A hitman becomes a doctor',
        :edition    => 1,
        :isbn10     => '9876543210',
        :isbn13     => 'abcdef1111111',
        :price      => 25.99,
        :published_at => Time.now,
        :publisher  => 'Knopf',
        :title      => 'Beat the Reaper' } ) )
      Sunspot.commit
    end

    context "Should return proper data" do
      it "Return both books" do
        add_data
        expect(Sunspot.search( Book ) { keywords 'King' }.results.map {|x| x.title }).to eql(['The Dark Tower','Beat the Reaper'])
      end
    end
  end

end

