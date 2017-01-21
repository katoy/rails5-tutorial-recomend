# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string
#  author     :string
#  page       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
  has_many :contents, as: :content
end
