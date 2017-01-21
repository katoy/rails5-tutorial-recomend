class Rec < ApplicationRecord
  belongs_to :content, polymorphic: true

  def self.make(recs = Rec.all, item_hash = { book: Book.all, music: Music.all, movie: Movie.all })
    num = recs.count / item_hash.size
    item_hash.each {|key, v| item_hash[key] = v.shuffle }
    items = item_hash.values.flatten!.shuffle!

    recs.each { |r| r.content = items.shift }
    recs.select(&:content)
  end
end
