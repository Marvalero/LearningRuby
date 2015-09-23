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



