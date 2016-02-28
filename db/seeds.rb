# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = ActiveSupport::JSON.decode(File.read("db/exercises.json"))

data.each do |a|

a.each do |name, attributes|

	WorkoutType.create!(
      name: name,
    	guide: attributes['guide'][0],
    	mechanics: attributes['Mechanics Type'],
    	workout_type: attributes['Type'],
    	level: attributes['Level'],
    	main_muscle: attributes['Main Muscle Worked'],
    	other_muscles: attributes['Other Muscles'],
    	force: attributes['Force']
		)

end

end