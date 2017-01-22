# == Schema Information
#
# Table name: recfs
#
#  id           :integer          not null, primary key
#  order        :integer          not null
#  content_type :integer          not null
#  fixed_flag   :integer          default("0")
#  fixed_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Recf < ApplicationRecord
  attr_accessor :content

  enum content_type: { book: 1, music: 2, movie: 3 }

  def self.show(recfs)
    recfs.each do |rec|
      p rec
      puts "\t#{rec.content.inspect}"
    end
  end
end
