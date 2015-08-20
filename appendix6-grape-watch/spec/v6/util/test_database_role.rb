module Watch
  module V6
    module Test
      module DatabaseRole
        def test_interface(obj)
          expect(obj).to respond_to(:update_database)
          expect(obj).to respond_to(:query)
          expect(obj).to respond_to(:delete)
        end
      end
    end
  end
end
