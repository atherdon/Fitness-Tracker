class WorkoutTypesController < ApplicationController

def typeahead
  render json: WorkoutType.search(params[:query], fields: [{name: :word_start}], limit: 10).map do |type| {name: type.name}
  end

end



end
