class WorkoutType < ActiveRecord::Base
	searchkick text_start: [:name], autocomplete: ['name']
end
