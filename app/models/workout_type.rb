class WorkoutType < ActiveRecord::Base
	searchkick text_start: [:name], autocomplete: ['name'], callbacks: :async, batch_size: 200

end
