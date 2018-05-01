require 'pry'
class Dog
  attr_accessor :id, :name, :breed

  def initialize(data)
    @id = nil
    data.each{ |k, v| self.send("#{k}=", v) }
  end

  def self.create_table
    sql =  <<-SQL
    CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end
end
