class StarWarsCli::CLI


  def start
    puts "Welcome to the Star Wars CLI!!!"
    puts ""
    puts "Select a category to view the associated objects"

    StarWarsCli::ApiService.get_categories

    category_menu
  end


  def category_menu
    categories = StarWarsCli::Category.all

    categories.each.with_index(1) do |cat, index|
      puts "#{index}. #{cat.name.capitalize}"
    end
    
    input = gets.strip
    
    index = input.to_i - 1
    
    category = categories[index]
    
    if category.name == 'people'
      StarWarsCli::ApiService.get_people
      people_menu
    elsif category.name == 'planets'
      StarWarsCli::ApiService.get_planets
      planets_menu
    end
  end
  
  def people_menu
    people = StarWarsCli::Person.all
    
    puts "Select a person to view their details: "
    people.each.with_index(1) do |person, index|
      puts "#{index}. #{person.name}"
    end


    puts "Would you like to see the next page of results?"

    input = gets.strip

    if input == "y"
      StarWarsCli::ApiService.get_people(StarWarsCli::Person.next_page)
    end

    input = gets.strip

    index = input.to_i - 1

    person = people[index]

    puts "Here are the details for #{person.name}:"
    puts "  Height: #{person.height}"
    puts "  Birth Year: #{person.birth_year}"
  end

  def planets_menu
    planets = StarWarsCli::Planet.all

    puts "Select a planet to view their details: "

    planets.each.with_index(1) do |planet, index|
      puts "#{index}. #{planet.name}"
    end

    input = gets.strip

    index = input.to_i - 1

    planet = planets[index]

    puts "Here are the details for #{planet.name}:"
    puts "  Diameter: #{planet.diameter}"
    puts "  Climste: #{planet.climate}"
  end
end