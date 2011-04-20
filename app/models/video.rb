class Video < ActiveRecord::Base

  ajaxful_rateable :stars => 5

  before_create :save_thumbnail

  mount_uploader :path, VideoUploader
  has_one :thumbnail
  belongs_to :person
  has_many :reviews
  has_many :likes
  validates :category, :presence => true
  validates :path, :presence => true


  def save_thumbnail
        logger.info "Saving thumbnail of Video..."
        t = Thumbnail.create!(self.path)
        self.thumbnail = t
        t
    end

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

