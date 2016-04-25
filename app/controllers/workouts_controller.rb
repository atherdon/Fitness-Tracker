class WorkoutsController < ApplicationController
	before_action :check_user, only: [:workout, :update_workout]

	def show
		@user = User.find_by_username(params[:username])
		@picture = Picture.new
		@workout = Workout.find(params[:id])
		respond_to do |format|
			format.html { render file: "/app/views/users/workouts/show.html.erb" }
		end
	end

	def workout
		@user = current_user
		exercises = params[:exercises]
		pictures = params[:images]
		parsed_date = DateTime.strptime(params[:date], '%m/%d/%Y')
		@picture = Picture.new
		@saved = false

		if params[:exercises].nil?
    	respond_to do |format|
    		flash.now[:info] = "No exercises."
        format.js {  render file: "/app/views/layouts/notice.js.erb" }
    	end
    	return   
    end

		@workout = @user.workouts.create(date: parsed_date)

		exercises.each do |name, sets|
			exercise = @workout.exercises.create(name: name)
			sets.each do |setNum, set|	

				xset = exercise.xsets.create(number: setNum)
				xset.create_rep(weight: set[0], reps: set[1])
			
			end
		end

		if pictures != nil 
			pictures.each_with_index do |picture, index|
				@picture = Picture.new(user_id: @user.id, workout_id: @workout.id, attachment: params[:images][index])
				if @picture.save
					@saved = true				
				else
					@saved = false
							
				end
			end

			if @saved == true 
				@workouts = Workout.paginate(page: 1, per_page: 3).order(created_at: :desc)
				respond_to do |format|
					format.js { render file: "/app/views/users/workouts/add_workout.js.erb" }
				end
			else
				flash.now[:error] = "Error."	
				respond_to do |format|
					format.js { render file: "/app/views/layouts/notice.js.erb" }
				end
			end
		else
			@workouts = Workout.paginate(page: 1, per_page: 3).order(created_at: :desc)
			respond_to do |format|
					format.js { render file: "/app/views/users/workouts/add_workout.js.erb" }
			end
		end 
	end

	def update_workout
		@user = current_user
		exercises = params[:exercises]
		pictures = params[:images]

		@saved = false

		if params[:exercises].nil?
    	respond_to do |format|
    		flash.now[:info] = "No exercises."
        format.js {  render file: "/app/views/layouts/notice.js.erb" }
    	end
    	return   
    end

		@workout = Workout.find(params[:workout_id])
		@workout.exercises.each do |ex|
			ex.destroy
		end
		
		exercises.each do |name, sets|
			exercise = @workout.exercises.create(name: name)
			sets.each do |setNum, set|	

				xset = exercise.xsets.create(number: setNum)
				xset.create_rep(weight: set[0], reps: set[1])
			
			end
		end

		@workout.save


		if pictures != nil 
			pictures.each_with_index do |picture, index|
				@picture = Picture.new(user_id: @user.id, workout_id: @workout.id, attachment: params[:images][index])
				if @picture.save
					@saved = true				
				else
					@saved = false
							
				end
			end

			if @saved == true 
				#@workouts = Workout.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
				respond_to do |format|
					flash.now[:success] = "Workout for #{@workout.date.strftime('%D')} updated."
					format.js { render file: "/app/views/users/workouts/update_workout.js.erb" }
					
				end
			else
				flash.now[:error] = "Error."	
				respond_to do |format|
					format.js { render file: "/app/views/layouts/notice.js.erb" }
				end
			end
		else
			#@workouts = Workout.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
			@workout = Workout.find(params[:workout_id])
			respond_to do |format|
					flash.now[:success] = "Workout for #{@workout.date.strftime('%D')} updated."
					format.js { render file: "/app/views/users/workouts/update_workout.js.erb" }
					
        	
			end
		end 

	end

	def like
		@user = User.find(params[:workout_user])
		@workout = Workout.find(params[:workout])
		if @workout.liked_by current_user
			respond_to do |format|
				format.js { render file: "/app/views/users/like.js.erb" }
			end
		else
			flash.now[:error] = "Error."	
			respond_to do |format|
				format.js { render file: "/app/views/layouts/notice.js.erb" }
			end
		end
	end

	def unlike
		@user = User.find(params[:workout_user])
		@workout = Workout.find(params[:workout])	
		if @workout.unliked_by current_user
			respond_to do |format|
				format.js { render file: "/app/views/users/like.js.erb" }
			end
		else
			flash.now[:error] = "Error."	
			respond_to do |format|
				format.js { render file: "/app/views/layouts/notice.js.erb" }
			end
		end
	end

private

	def check_user
		unless params[:username] = current_user.username
			flash.now[:alert] = "Incorrect user." and return
		end
	end

end









