require 'sequel'

DB = Sequel.sqlite # memory database

DB.create_table :items do
  primary_key String :id
  String :name
  Float :price
end

items = DB[:items] # Create a dataset

# Populate the table
items.insert(id: "a",:name => 'abc', :price => rand * 100)
items.insert(id: "b",:name => 'def', :price => rand * 100)
items.insert(id: "c",:name => 'ghi', :price => rand * 100)

# Delete a row
items.filter(id: "a").delete
# Show rows
items.each{|row| p row.inspect}

# Update a row
items.where(id: "b").update(:name => 'change', :price => 100000)
items.where(id: "new").update(:name => 'new', :price => 100000)
items.each{|row| p row.inspect}


# Print out the number of records
puts "Item count: #{items.count}"

# Print out the average price
puts "The average price is: #{items.avg(:price)}"
