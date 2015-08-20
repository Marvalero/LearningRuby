module Watch
  module V6
    module Test
      module ActionRole
        def test_interface(obj)
          expect(obj).to respond_to(:get_watch)
          expect(obj).to respond_to(:set_topic)
          expect(obj).to respond_to(:db_conector)
        end
      end
    end
  end
end
