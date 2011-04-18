class Video < ActiveRecord::Base

  ajaxful_rateable :stars => 5

  has_many :reviews
  has_many :likes
  validates :category, :presence => true
  validates :path, :presence => true
end
# == Schema Information
#
# Table name: videos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  category    :string(255)
#  description :text
#  path        :string(255)
#  hits        :integer
#  likes       :integer
#  created_at  :datetime
#  updated_at  :datetime
#  review_id   :integer
#  tags        :string(255)
#

