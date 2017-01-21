# == Schema Information
#
# Table name: recxes
#
#  id         :integer          not null, primary key
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recx < ApplicationRecord
  attr_accessor :content

  def self.make(recxes = Recx.all, item_hash = { book: Book.all, music: Music.all, movie: Movie.all })
    num = recxes.count / item_hash.size
    item_hash.each {|key, v| item_hash[key] = v.shuffle }
    items = item_hash.values.flatten!.shuffle!

    recxes.each { |r| r.content = items.shift }
    recxes.select(&:content)
  end
end
