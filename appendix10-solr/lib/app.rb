require_relative 'memory'

class Book
  # A book includes instance variables for
  #   # the author, a title, a publisher, an edition, a 10- and 13-digit
  #     # ISBN number, a blurb, a publication date, and a price.
  attr_accessor :author, :blurb, :edition,
    :isbn10, :isbn13, :price, :published_at, :publisher, :title

  def id
    self.object_id
  end

  def initialize( attrs = {} )
    attrs.each_pair { |attribute, value|
      self.send "#{attribute}=", value }
  end
end

Sunspot::Adapters::InstanceAdapter.register(
  Memory::InstanceAdapter, Book)

Sunspot::Adapters::DataAccessor.register(
  Memory::DataAccessor, Book )

Sunspot.setup(Book) do
  text    :author
  text    :blurb
  integer :edition
  string  :isbn10, :isbn13
  float   :price
  time    :published_at
  text    :publisher
  string  :sort_title do
    title.downcase.sub(/^(an?|the)\W+/, '') if title = self.title
  end
  text    :title
end


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
puts reaper, king

Sunspot.search( Book ) { keywords 'King' }.results.each {|x|
  puts x.title }

search2 = Sunspot.search( Book ) do
  with( :price ).less_than( 30 )
end

search2.results.each { |s| puts s.title } 

Sunspot.remove_all!( Book )


