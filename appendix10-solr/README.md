# Sunspot_solr Explanation

We need an object and an adapter to Solr for the object

#### Object
We have to define the object in Ruby:

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

And then in Solr:

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
    
    
#### Adapter

To make Solr and Ruby working together, we need an instance adapter and data accesor:

    Sunspot::Adapters::InstanceAdapter.register(Memory::InstanceAdapter, Book)
    Sunspot::Adapters::DataAccessor.register(Memory::DataAccessor, Book )

This classes are:

         module Memory
            class InstanceAdapter < Sunspot::Adapters::InstanceAdapter
              def id
                @instance.object_id
              end
            end

           class DataAccessor < Sunspot::Adapters::DataAccessor
             def load( id )
                ObjectSpace._id2ref( id.to_i )
             end

            def load_all( ids )
              ids.map { |id| ObjectSpace._id2ref( id.to_i ) }
            end
           end
         end

#### Commiting data into Solr

Create a new book and commit the data into Solr

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
      Sunspot.commit  

#### Searching

Making a query

    search2 = Sunspot.search( Book ) do
      with( :price ).less_than( 30 )
    end
    search2.results.each { |s| puts s.title } 

Or 

    Sunspot.search( Book ) { keywords 'King' }.results.each {|x| puts x.title }
  
#### Removing data
Delete the data

    Sunspot.remove_all!( Book )


