module VideosHelper
  def show_ratings
    ratings_for @video, current_person
    # ratings_for @video, :remote_options => {:url => your_rate_path(@article)}
  end


  def recommended_videos(video)
    @rec_videos = Video.find(:all, :order => 'hits DESC', :conditions => ['category = ?', video.category]).first(5)
  end

  def recent_videos(video)
    @rec_videos = Video.find(:all, :order => 'created_at DESC').first(5)
  end

  def user_like_status(video)
    status = "neutral"
    user = current_person

    user.likes.each do |like|
      if like.video_id == video.id
        if like.status == true
          status = "like"
        else
          status = "dislike"
        end
      end
    end
    status
  end
end
