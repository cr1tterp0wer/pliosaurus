# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  validates :title, uniqueness: true, presence: true

  has_many :group_users,
    primary_key: :id,
    foreign_key: :group_id,
    class_name: :GroupUserJoin
  has_many :users,
    through: :group_users,
    source: :user

end
