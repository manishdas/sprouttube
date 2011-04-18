module PeopleHelper
  def show_user
    @liked_videos = Like.where(person_id = @person.id)
    @liked_videos.each do |video|
      @video = Video.find(video.video_id)
    end
  end

end