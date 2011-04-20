class Thumbnail < ActiveRecord::Base

  has_one :video

  def self.create!(vpath)
    temp = vpath.to_s.split("/")
    thumbname = temp.last
    tpath = "/uploads/thumbnails/#{thumbname}.jpg"
    system "ffmpeg  -ss 12 -i  #{Rails.root}/public#{vpath.to_s} -f image2 -vframes 1  #{Rails.root}/public#{tpath}"
    t = Thumbnail.new(:path => tpath)
    t.save ? t : false
  end
end
