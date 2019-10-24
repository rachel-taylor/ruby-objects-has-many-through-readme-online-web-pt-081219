class Waiter
 
  attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip=0)
    meal.new(self, customer, total, tip)
  end
  
  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end
  
  def meals
    Meal.all.select do |meal|
      meal.waiter == self #checking for waiter now
    end
  end
 
end