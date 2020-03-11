require("pry")

require_relative('../models/album')
require_relative('../models/artist')
#
Album.delete_all()
Artist.delete_all()

artist1 = Artist.new(
  {
    "name" => "Billy Bob"
  }
)
artist1.save()
artist2 = Artist.new(
  {
    "name" => "Bobby Bill"
  }
)
artist2.save()


album1 = Album.new(
  {
    "title" => "Billy Bob's greatest hits",
    "genre" => "Folk",
    "artist_id" => artist1.id
  }
)
album1.save()
album2 = Album.new(
  {
    "title" => "Bobby Bill's No.1's",
    "genre" => "Polka",
    "artist_id" => artist2.id
  }
)
album2.save()
album3 = Album.new(
  {
    "title" => "Billy Bob's worst hits",
    "genre" => "Folk",
    "artist_id" => artist1.id
  }
)
album3.save()

binding.pry
nil
