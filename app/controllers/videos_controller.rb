class VideosController < ApplicationController
  before_filter :authenticate_person!, :except => [:index, :show, :likes, :dislikes]


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
    if @video.save
      current_person.points += 10
      current_person.update_attributes(params[:person])
      redirect_to video_path(@video), :notice => "Video Submitted Successfully"
    else
      render :action => "new", :alert => "Video Submission Failed!!"
    end
  end

  def new
    @video = Video.new
    @category = Category.new
  end

  def likes
    @video = Video.find(params[:video_id])
    p_id = current_person.id

    @like = Like.find(:all, :conditions => [' person_id = ? AND video_id = ? ', p_id, params[:video_id] ])
    if @like.count == 1
      @like[0].update_attributes(:status => true)
    else
      Like.create(:person_id => p_id, :video_id => params[:video_id], :status => true )
    end

    if @video.save
      redirect_to video_path(@video), :notice => "You Just Gave Thumbs Up To this Video"
    else
      redirect_to video_path(@video), :alert => "Whoaa... Something Went Wrong"
    end
  end

  def dislikes
    @video = Video.find(params[:video_id])
    p_id = current_person.id

    @like = Like.find(:all, :conditions => [' person_id = ? AND video_id = ? ', p_id, params[:video_id] ])
    if @like.count == 1
      @like[0].update_attributes(:status => false)
    else
      Like.create(:person_id => p_id, :video_id => params[:video_id], :status => false )
    end

    if @video.save
      # respond_to do |format|
      #          format.js
      #        end
      redirect_to video_path(@video), :notice => "You Just Gave Thumbs Down To this Video"
    else
      redirect_to video_path(@video), :alert => "Whoaa... Something Went Wrong"
    end
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

