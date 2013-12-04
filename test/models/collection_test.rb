require 'test_helper'

class CollectionTest < ActiveSupport::TestCase
  setup do
    @collection_defaults = {
      name: 'Test Collection'
    }
  end

  test "should be invalid if missing required data" do
    collection = Collection.new
    assert !collection.valid?

    [:name].each do |field_name|
      assert collection.errors.keys.include? field_name
    end
  end

  test "should be valid if required data exists" do
    collection = Collection.new(@collection_defaults)
    assert collection.valid?
  end
end
