class VideosController < ApplicationController
  before_filter :authenticate_person!, :except => [:index, :show]


  def index
    if params[:search]
       @videos = Video.find(:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"]).paginate :per_page => 3, :page => params[:page], :order => 'created_at DESC'

    else
      @videos = Video.all.paginate :per_page => 6, :page => params[:page], :order => 'created_at DESC'
    end

  end

  def destroy
    @video = Video.find(params[:id])
    if @video.destroy
      redirect_to videos_path, :notice => "Video Deleted Successfully"
    else
      redirect_to videos_path, :alert => "Oops!! Video Deletion Failed!!"
    end
  end

  def show
    @video = Video.find(params[:id])
    increase_video_hits(@video)
    @review = @video.reviews.new
    @reviews = @video.reviews
    respond_to do |format|
      format.html {render :layout => 'video_show_layout'}
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      redirect_to videos_path, :notice => "Video Updated Successfully"
    else
      render :action => "edit", :alert => "Video Update Failed!!"
    end

  end

  def create
    @video = Video.new(params[:video])
    @people = Person.all
    if @video.save
      current_person.points += 10
      current_person.update_attributes(params[:person])
      @people.each do |person|
        UserMailer.upload_email(person,@video).deliver
      end
      redirect_to video_path(@video), :notice => "Video Uploaded Successfully"
    else
      render :action => "new", :alert => "Video Upload has been Failed!!"
    end
  end

  def new
    @video = Video.new
    @category = Category.new
  end

  def rate
     @video = Video.find(params[:id])
     @video.rate(params[:stars], current_user)
     respond_to do |format|
       format.js
     end
   end

  private
  def increase_video_hits(video)
    puts "I'm here #{video.hits}"
    video.hits += 1
    video.save
    puts "hits:: #{video.hits}"
  end
end

