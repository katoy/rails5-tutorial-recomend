# == Schema Information
#
# Table name: recs
#
#  id           :integer          not null, primary key
#  order        :integer
#  content_type :string
#  content_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class RecTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
