# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  longitude  :float
#  latitude   :float
#

class Location < ApplicationRecord
  validates :longitude,:latitude, presence:true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
