require 'rubygems'
require 'sunspot'

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

