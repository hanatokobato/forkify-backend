puts "START SEEDING"

puts "States"
file_to_load  = Rails.root + 'db/seeds/states.yml'
states_list   = YAML::load( File.open( file_to_load ) )


states_list.each_pair do |key, state|
  s = State.find_by(abbreviation: state['attributes']['abbreviation'], country_id: state['attributes']['country_id'])
  State.create(state['attributes']) unless s
end
