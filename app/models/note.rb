# == Schema Information
#
# Table name: notes
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  content       :text
#  collection_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Note < ActiveRecord::Base
  validates_presence_of :title, :collection_id
  belongs_to :collection
end
