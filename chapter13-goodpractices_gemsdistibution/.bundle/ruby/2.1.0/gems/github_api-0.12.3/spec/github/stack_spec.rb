require 'spec_helper'

describe Github::Configuration do
  # let(:object) { described_class }
  #
  # subject(:config) { object.new }
  #
  # before {
  #   middleware = proc { |builder| 'value' }
  #   allow(Github::Middleware).to receive(:default).and_return(middleware)
  # }
  #
  # xit "returns default stack and caches it" do
  #   stack = config.stack
  #   expect(stack).to be_kind_of(Faraday::RackBuilder)
  #   expect(config.stack).to eq(stack)
  # end
  #
  # xit "allows to customise stack" do
  #   middleware = double(:middleware)
  #   config.stack do |builder|
  #     builder.use middleware
  #   end
  #   expect(config.stack.handlers.first).to eq(middleware)
  # end
end
