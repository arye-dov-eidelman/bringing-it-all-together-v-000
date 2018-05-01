require 'pry'
class Dog
  attr_accessor :name, :breed

  def initialize(data)
    data.each{ |k, v| self.send("#{k}=", v) }
  end
end
