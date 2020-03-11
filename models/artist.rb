require('pg')

require_relative('album')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options["name"]
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map{|album| Album.new(album)}
    return albums
  end

  def save()
    sql = "INSERT INTO artists (
    name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end


  def self.delete_all()
    sql = "DELETE FROM  artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def update()
    sql = "UPDATE artists SET (
    name
    )
    =
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end
end
