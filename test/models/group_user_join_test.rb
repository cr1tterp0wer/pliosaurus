# == Schema Information
#
# Table name: group_user_joins
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  group_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GroupUserJoinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
