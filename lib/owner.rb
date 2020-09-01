require 'pry'

class Owner
  # code goes here

  attr_reader :species, :name
  attr_accessor :cats, :dogs
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}    
  end

  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
    @cats << cat
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
    @dogs << dog
  end

  

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{@cats.count} cat(s)."
  end

  def sell_pets
    owners_cats = Cat.all.select {|cat| cat.owner == self}
    owners_dogs = Dog.all.select {|cat| cat.owner == self}
    

    self.cats.each {|cat| cat.mood = "nervous"}
    owners_cats.each {|cat| cat.owner = nil}

    self.dogs.each {|dog| dog.mood = "nervous"}
    owners_dogs.each {|dog| dog.owner = nil}


    # binding.pry
    
    


    self.cats.clear
    self.dogs.clear
    


  end






end
