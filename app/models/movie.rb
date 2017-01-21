class Movie < ApplicationRecord
  has_many :contents, as: :content
end
