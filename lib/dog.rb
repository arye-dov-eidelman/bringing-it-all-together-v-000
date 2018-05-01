require 'pry'
class Dog
  attr_accessor :id, :name, :breed

  def initialize(data)
    @id = nil unless id
    data.each{ |k, v| self.send("#{k}=", v) }
  end

  def save
    sql =  <<-SQL
      INSERT INTO dogs(name, breed)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, @name, @breed)
    @id = DB[:conn].execute('SELECT last_insert_rowid()')[0][0]
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

  def self.create(data)
    self.new(data).save
  end

  def self.find_by_id(id)
    sql =  <<-SQL
      SELECT * FROM dogs
      WHERE id = ?
    SQL
    row = DB[:conn].execute(sql, id)[0]
    self.new({id: row[0], name: row[1], breed: row[2]})
  end

  def self.find_or_create_by(data)
    sql =  <<-"SQL"
      SELECT * FROM dogs
      WHERE name = ? & breed = ?
    SQL
    row = DB[:conn].execute(sql, data[:name], data[:breed])[0]
    if row
      print "id found: #{row[0]}"
      self.new({id: row[0], name: row[1], breed: row[2]})
    else
      print "id not found: #{data[:id]}"
      self.create(data)
    end
  end
end
