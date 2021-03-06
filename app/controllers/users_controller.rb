class UsersController < ApplicationController
  before_action :create_enricher

  def index

  end

  def search
    render json: User.search(params[:query], autocomplete: true, limit: 10).map do |user| {name: user.username}
    end
  end

  def notification
    notif_feed = StreamRails.feed_manager.get_notification_feed(current_user.id)
    notif_results = results = notif_feed.get()['results']
    @notifications = @enricher.enrich_aggregated_activities(notif_results).paginate(:page => params[:page], :per_page => 5)
  end

  def feed
    feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:flat]
    @results = feed.get()['results']
    @activities = @enricher.enrich_activities(@results).paginate(:page => params[:page], :per_page => 10)


    if @activities.blank?
      @random_users = User.recommended_users(current_user).order_by_rand.limit(10)
    end
    
    respond_to do |format|
      format.html
      format.js { render file: "/app/views/users/feed.js.erb" }
    end

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

  def flag_user
    @user = User.find_by_username(params[:username])
    current_user.flag(@user, "Inappropriate image")
    respond_to do |format|
      flash.now[:info] = "User flagged."
      format.js { render file: "/app/views/users/add_flag.js.erb" }
    end
  end


  def follow_user
    @follower = User.find_by_username(params[:username])
    @following = User.where(id: params[:following_id]).first
    @user = @following

    if @follower == @following
      respond_to do |format|
        flash.now[:warning] = "Cannot follow yourself."
        format.js {  render file: "/app/views/layouts/notice.js.erb" }
      end
    end

    if @follower.follow(@following)
      StreamRails.feed_manager.follow_user(@follower.id, @following.id)
      respond_to do |format|
        format.js { render file: "/app/views/users/follow.js.erb", :locals => {:user => @user} }
      end
    else
      respond_to do |format|
        flash.now[:info] = "Error."
        format.js {  render file: "/app/views/layouts/notice.js.erb" }
      end
    end
  end

  def unfollow_user
    @follower = User.find_by_username(params[:username])
    @following = User.find(params[:following_id])
    @user = @following

    if @follower.stop_following(@following)  
      StreamRails.feed_manager.unfollow_user(@follower.id, @following.id)
      respond_to do |format|
        format.js { render file: "/app/views/users/follow.js.erb", :locals => {:user => @user} }
      end
    else
      respond_to do |format|
        flash.now[:info] = "Error."
        format.js { render file: "/app/views/users/add_flag.js.erb" }
      end
    end
  end

  def suggest_follow_user
    @follower = User.find_by_username(params[:username])
    @following = User.where(id: params[:following_id]).first
    @user = @following


    if @follower.follow(@following)
      StreamRails.feed_manager.follow_user(@follower.id, @following.id)
      respond_to do |format|
        format.html { head :no_content }
      end
    else
      respond_to do |format|
        flash.now[:info] = "Error."
        format.html { render @user }
      end
    end
  end



  def create_enricher
    @enricher = StreamRails::Enrich.new
  end


  private

  def picture_params
  	params.require(:picture).permit(:image, :item_id)
  end
end










