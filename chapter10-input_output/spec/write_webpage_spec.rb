#!/urs/bin/ruby

require "write_webpage"

RSpec.configure do |c|
    c.color = true
      c.formatter = 'documentation'
end

describe WriteWebpage do
  let(:file_name) { "google.txt" }

  describe "#read_from_web" do
    context "Read a webpage" do
      it "google.com" do
        expect(WriteWebpage.new.read_from_web("http://www.google.com/").title).to eql("Google")
      end
    end
  end

  describe "#write_in_file" do
    context "Writing a web in a file" do
      it "exist file" do
        reader = WriteWebpage.new
        reader.read_from_web("http://www.google.com/search?q=doughnuts")
        reader.write_in_file(file_name)
        expect(File).to exist(file_name)
      end
      it "correct content" do
        reader = WriteWebpage.new
        reader.read_from_web("http://www.google.com/search?q=doughnuts")
        reader.write_in_file(file_name)
        expect(IO.read(file_name)).to match("Google")
      end
     end
  end
end
