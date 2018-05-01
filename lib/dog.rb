require 'pry'
class Dog
  attr_accessor :id, :name, :breed

  def initialize(data)
    @id = nil
    data.each{ |k, v| self.send("#{k}=", v) }
  end

  def save
    sql =  <<-SQL
      INSERT INTO dogs(name, breed)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, @name, @breed)
    @id = 
    DB[:conn].execute('SELECT last_insert_rowid()')
    self
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

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end
end
