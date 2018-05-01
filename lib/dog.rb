require 'pry'

class Dog
  attr_accessor :name, :bread

  def initialize(data)
    data.each{|k, v|
      self.send("#{k}=", v)
    }
  end

end
