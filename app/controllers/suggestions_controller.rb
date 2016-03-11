class SuggestionsController < ApplicationController
	def add_suggestion
		@user = current_user
		@suggestion = @user.suggestions.build(subject: params[:subject], body: params[:body])

		if @suggestion.save
			respond_to do |format|
				format.js { render file: "/app/views/users/add_suggestion.js.erb" }
			end
		else
			respond_to do |format|
				format.html { render @user }
			end
		end
	end
end
