class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by_username(params[:username])
    @picture = Picture.new
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

  private

  def picture_params
  	params.require(:picture).permit(:image, :item_id)
  end
end
