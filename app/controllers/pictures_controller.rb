class PicturesController < ApplicationController

	def new
		@picture = Picture.new
	end

	def create
		@user = current_user
		@picture = @user.pictures.build(picture_params)
		if @picture.save
  	  render json: { message: "success" }, :status => 200
  	else
  	  #  you need to send an error header, otherwise Dropzone
          #  will not interpret the response as an error:
  	  render json: { error: @picture.errors.full_messages.join(',')}, :status => 400
  	end  
	end

	private

	def picture_params
		params.require(:picture).permit(:attachment, :caption)
	end	
end
