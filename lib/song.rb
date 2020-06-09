require "pry"

class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
 
  def self.new_by_filename(file)
    name = file.split(" - ")[1]
    song = self.new(name)
    song.artist_name = file.split(" - ")[0]
  end
  
  def artist_name=(name)
    if Artist.find_or_create_by_name(name)
    else
    self.artist = Artist.new(name)
    end
  end
  
  def self.all
    @@all
  end
  
end