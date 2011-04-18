module PeopleHelper
  def show_user
    @videos = []
    @person_likes = @person.likes
    @person_likes.each do |like|
      @videos << Video.find(like.video_id)
    end
    return @videos
  end

  def reviewed
    @videos = []
    @person_reviewed = @person.reviews
    @person_reviewed.each do |review|
      @videos << Video.find(review.video_id)
    end
    return @videos
  end
end