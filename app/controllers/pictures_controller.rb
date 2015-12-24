class PicturesController < ApplicationController
	before_action :check_bora, only: [:create]
	before_action :check_user_before_delete, only: [:delete_before_pic, :delete_after_pic]

	def new
		@picture = Picture.new
	end

	def before_picture
		@user = current_user
		if @user.before.present?
			flash.now[:alert] = "Before pic already exists." and return
		end
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

	def delete_before_pic
		@user = current_user
		@picture = Picture.where(id: @user.before).first
		@picture.delete
		respond_to do |format|
			if @picture.delete
				@user.update_attribute(:before, nil)
				format.js { render file: "/app/views/users/delete_before_pic.js.erb" }
			else
				format.html { render action: 'show' }
			end
		end
	end

	def after_picture
		@user = current_user
		if @user.after.present?
			flash.now[:alert] = "After pic already exists." and return
		end
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

	def delete_after_pic
		@user = current_user
		@picture = Picture.where(id: @user.after).first
		@picture.delete
		respond_to do |format|
			if @picture.delete
				@user.update_attribute(:after, nil)
				format.js { render file: "/app/views/users/delete_after_pic.js.erb" }
			else
				format.html { render action: 'show' }
			end
		end
	end

	private

	def check_user_before_delete
		unless params[:username] = current_user.username
			flash.now[:alert] = "Incorrect user." and return
		end
	end

	def check_bora
		unless params[:bora] = "before" || params[:bora] = "after"
			flash.now[:alert] = "Incorrect paramaters." and return
		end
	end


	def picture_params
		params.require(:picture).permit(:attachment, :caption, :bora)
	end	
end
