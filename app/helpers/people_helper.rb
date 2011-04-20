module PeopleHelper
  def show_user
    @videos = []
    @person_rates = Rate.where("rater_id = #{@person.id}")
    @person_rates.each do |r|
      @videos << Video.find(r.rateable_id)
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