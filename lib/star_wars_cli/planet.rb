class StarWarsCli::Planet
  attr_accessor :name, :diameter, :climate

  @@all = []

  def initialize(name, diameter, climate)
    @name = name
    @diameter = diameter
    @climate = climate
    @@all << self
  end

  def self.all
    @@all
  end
end