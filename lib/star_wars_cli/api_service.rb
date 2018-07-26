class StarWarsCli::ApiService

  BASE_URL = "https://swapi.co/api"

  def self.get_categories
    response = RestClient.get(BASE_URL)
    
    json = JSON.parse(response)
    
    json.each do |cat_name, url|
      
      StarWarsCli::Category.new(cat_name, url)
    end
  end
  
  def self.get_people(url = "#{BASE_URL}/people")
    StarWarsCli::Person.all.clear
    response = RestClient.get(url)
    
    json = JSON.parse(response)
    
    StarWarsCli::Person.set_next_page(json["next"])

    json["results"].each do |person_hash|
      StarWarsCli::Person.new(person_hash["name"], person_hash["height"], person_hash["birth_year"])

    end
    binding.pry
  end

  def self.get_planets
    response = RestClient.get(BASE_URL + 'planets')
    
    json = JSON.parse(response)
    
    json["results"].each do |planet_hash|
      StarWarsCli::Planet.new(planet_hash["name"], planet_hash["diameter"], planet_hash["climate"])

    end

  end
end