class PicturesController < ApplicationController
	before_action :check_bora, only: [:create, :update]
	before_action :check_profile_exists, only: [:create]

	def new
		@picture = Picture.new
	end

	def before_picture
		@user = current_user
		@picture = @user.pictures.build(picture_params)
		if @picture.save
			@user.update_attribute(:before, @picture.id)
  	  render json: { message: "success" }, :status => 200
  	else
  	  #  you need to send an error header, otherwise Dropzone
          #  will not interpret the response as an error:
  	  render json: { error: @picture.errors.full_messages.join(',')}, :status => 400
  	end  
	end

	def after_picture
		@user = current_user
		@picture = @user.pictures.build(picture_params)	
		if @picture.save
			@user.update_attribute(:after, @picture.id)
  	  render json: { message: "success" }, :status => 200
  	else
  	  #  you need to send an error header, otherwise Dropzone
          #  will not interpret the response as an error:
  	  render json: { error: @picture.errors.full_messages.join(',')}, :status => 400
  	end 
	end

	private

	def check_bora
		unless params[:bora] = "before" || params[:bora] = "after"
			flash.now[:alert] = "Incorrect paramaters."
			return
		end
	end

	def check_profile_exists
		if current_user.before.present? && params[:bora] = "before"
			flash.now[:alert] = "Before pic already exists." and return
		elsif current_user.after.present? && params[:bora] = "after"
			flash.now[:alert] = "After pic already exists." and return
		end
	end

	def picture_params
		params.require(:picture).permit(:attachment, :caption, :bora)
	end	
end
