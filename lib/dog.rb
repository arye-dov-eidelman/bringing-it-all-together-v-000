require 'pry'

class Dog
  attr_accessor :name, :bread

  def initialize(data)
    print self
    binding.pry
    data.each{|k, v| self.send("#{k}=", v)}
  end

end
