puts "START SEEDING"

puts "COUNTRIES"
file_to_load  = Rails.root + 'db/seeds/countries.yml'
countries_list   = YAML::load( File.open( file_to_load ) )

countries_list.each_pair do |key, country|
  s = Country.find_by(abbreviation: country['abbreviation'])
  unless s
    c = Country.create(country) unless s
  end
end
