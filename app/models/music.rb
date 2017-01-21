# == Schema Information
#
# Table name: musics
#
#  id         :integer          not null, primary key
#  name       :string
#  player     :string
#  playtime   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Music < ApplicationRecord
  has_many :contents, as: :content
end
