class Music < ApplicationRecord
  has_many :contents, as: :content
end
