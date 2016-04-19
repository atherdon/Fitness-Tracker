class WorkoutType < ActiveRecord::Base
	searchkick text_start: [:name], autocomplete: ['name']

	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
