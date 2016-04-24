class WorkoutType < ActiveRecord::Base
	searchkick text_start: [:name], autocomplete: ['name'], batch_size: 20, callbacks: :async

end
