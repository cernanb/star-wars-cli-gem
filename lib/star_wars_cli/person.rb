class StarWarsCli::Person
  attr_accessor :name, :height, :birth_year

  @@all = []
  @@next_page = ''

  def initialize(name, height, birth_year)
    @name = name
    @height = height
    @birth_year = birth_year
    @@all << self
  end

  def self.all
    @@all
  end

  def self.set_next_page(url)
    @@next_page = url
  end

  def self.next_page
    @@next_page
  end
end