class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by_username(params[:username])
    @picture = Picture.new
    @workouts = @user.workouts.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js { render file: "/app/views/users/workouts/workout.js.erb" }
    end
  end

  def before_picture
  	@user = current_user
  	@before_picture = @user.pictures.build(picture: params[:before_picture])

  	if @before_picture.save
  		@user.before = @before_picture.id
  		respond_to do |format|
  			format.html { redirect_to current_user}
  			format.js
  		end
  	end
  end

  def after_picture
  	@user = current_user
  	@after_picture = @user.pictures.build(picture: params[:after_picture])

  	if @after_picture.save
  		@user.after = @after_picture.id
  		respond_to do |format|
  			format.html { redirect_to current_user}
  			format.js
  		end
  	end
  end

  def before_stats
    @user = current_user
    @exercise = params[:exercise]
    @weight = params[:weight]
    @h = @exercise.zip(@weight)
    @stats = {}

    @h.each do |exercise, weight|
      @stats["#{exercise}"] = "#{weight}"
    end
    if @user.update_attribute(:stats_before, @stats)
      respond_to do |format|
        format.js { render file: "/app/views/users/before_after_stats/before_stats.js.erb" }
      end
    else
      format.html { redirect_to current_user}
    end
  end

  def after_stats
    @user = current_user
    @exercise = params[:exercise]
    @weight = params[:weight]
    @h = @exercise.zip(@weight)
    @stats = {}

    @h.each do |exercise, weight|
      @stats["#{exercise}"] = "#{weight}"
    end
    if @user.update_attribute(:stats_after, @stats)
      respond_to do |format|
        format.js { render file: "/app/views/users/before_after_stats/after_stats.js.erb" }
      end
    else
      format.html { redirect_to current_user}
    end
  end

  #not in use
  def update_before_stats
    @user = current_user
    @exercise = params[:exercise]
    @weight = params[:weight]
    @h = @exercise.zip(@weight)
    @stats = {}

    @h.each do |exercise, weight|
      if @user.stats_before["#{exercise}"].present? && @user.stats_before[exercise] != weight
        @stats["#{exercise}"] = "#{weight}"
      else
        @stats["#{exercise}"] = "#{weight}"
      end
    end

    if @user.update_attribute(:stats_before, @stats)
      respond_to do |format|
        format.html { redirect_to current_user}
        format.js
      end
    end
  end

  def update_after_stats

  end








  private

  def picture_params
  	params.require(:picture).permit(:image, :item_id)
  end
end
