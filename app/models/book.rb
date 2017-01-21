class Book < ApplicationRecord
  has_many :contents, as: :content
end
