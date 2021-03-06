class PicturesController < ApplicationController
	before_action :check_bora, only: [:create]
	before_action :check_user, only: [:before_picture, :delete_before_pic, :after_picture, :delete_after_pic, :delete_session_pic]

	def new
		@picture = Picture.new
	end

	def before_picture
		@user = current_user
		if @user.before.present?
			flash.now[:alert] = "Before pic already exists." and return
		end
		@picture = @user.pictures.build(picture_params)
		respond_to do |format|
			if @picture.save
				@user.update_attribute(:before, @picture.id)
				format.js { render file: "/app/views/users/profile_images/before_picture.js.erb" }
	  	else
	  	  #  you need to send an error header, otherwise Dropzone
	          #  will not interpret the response as an error:
	  	  format.html { render 'show' }
	  	end
	  end  
	end

	def delete_before_pic
		@user = current_user
		@picture = Picture.where(id: @user.before).first
		@picture.delete
		respond_to do |format|
			if @picture.delete
				@user.update_attribute(:before, nil)
				format.js { render file: "/app/views/users/profile_images/delete_before_pic.js.erb" }
			else
				format.html { render 'show' }
			end
		end
	end

	def after_picture
		@user = current_user
		if @user.after.present?
			flash.now[:alert] = "After pic already exists." and return
		end
		@picture = @user.pictures.build(picture_params)	
		respond_to do |format|
			if @picture.save
				@user.update_attribute(:after, @picture.id)
	  	  format.js { render file: "/app/views/users/profile_images/after_picture.js.erb" }
	  	else
	  	  #  you need to send an error header, otherwise Dropzone
	          #  will not interpret the response as an error:
	  	  format.html { render 'show' }
	  	end 
  	end	
	end

	def delete_after_pic
		@user = current_user
		@picture = Picture.where(id: @user.after).first
		@picture.delete
		respond_to do |format|
			if @picture.delete
				@user.update_attribute(:after, nil)
				format.js { render file: "/app/views/users/profile_images/delete_after_pic.js.erb" }
			else
				format.html { render @user }
			end
		end
	end

	def delete_session_pic
		@user = current_user
		@picture = Picture.find(params[:pic_id])
		id = @picture.workout_id
		@workout = Workout.find(id)
		respond_to do |format|
			if Picture.destroy(params[:pic_id]) 	
				format.html { head :no_content }
			else
				format.html { render @user }
			end
		end
	end

	private

	def check_user
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
