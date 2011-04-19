class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
    @videos = Video.find(:all, :order => 'created_at DESC', :conditions => ['category = ?', @category.name])
  end

  def create
    @category = Category.create(params[:category])
    if @category.save
      respond_to do |format|
        format.html { redirect_to('new_video_path(current_user)') }
        format.js
      end
    end
  end

end
