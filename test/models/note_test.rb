require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  setup do
    @note_defaults = {
      title: 'My First Note',
      content: 'Holy crap it is some content.',
      collection_id: 1
    }
  end

  test "should be invalid if missing required data" do
    note = Note.new
    assert !note.valid?
    [:title, :collection_id].each do |field_name|
      assert note.errors.keys.include? field_name
    end
  end

  test "should be valid if required data exists" do
    note = Note.new(@note_defaults)
    assert note.valid?
  end
end
