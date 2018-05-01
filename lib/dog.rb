require 'pry'

class Dog
  attr_accessor :name, :bread

  def initialize(data)
    data.each{|k, v| self.send(k.to_s+'=', v)}
  end

end
