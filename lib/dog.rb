require 'pry'

class Dog
  attr_accessor :name, :bread

  def initialize(data)
    @name = data.name
    @bread = data.bread
  end

end
