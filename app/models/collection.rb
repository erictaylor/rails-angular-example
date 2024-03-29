# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Collection < ActiveRecord::Base
  validates_presence_of :name
  has_many :notes
end
