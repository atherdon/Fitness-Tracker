class WorkoutType < ActiveRecord::Base
	searchkick word_start: [:name], autocomplete: ['name'], batch_size: 20, callbacks: :async

end
