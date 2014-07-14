
$LOAD_PATH << '../lib'
require_relative '../lib/shoe'

require 'minitest/spec'
require 'minitest/autorun'

describe Shoe do
	it "should raise exception for decks less than 1 or more than 5" do
		lambda { Shoe.new(-1) }.must_raise(RuntimeError)
		lambda { Shoe.new(7) }.must_raise(RuntimeError)
	end
end
