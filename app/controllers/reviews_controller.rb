class ReviewsController < ApplicationController
  before_filter :authorize_review

  def new
    @video = Video.find(params[:video_id])
    @review = @video.reviews.new
  end

  def create
    @video = Video.find(params[:video_id])
    @person = current_person
    @review = @video.reviews.new(params[:review])
    @review.person_id = @person.id
    @person.increase_points
    if @review.save && @person.save
      redirect_to video_path(@video), :notice => "Great! You Just Made a Review"
    else
      render :action => "new", :alert => "Oops! Unable to Post Review Right Now!"
    end
  end

end

