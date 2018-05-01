require 'pry'

class Dog
  attr_accessor :name, :bread

  def initialize(name:, bread:)
    @name = name
    @bread = bread
  end
end
