require "pry"

class Artist
attr_accessor :name
@@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
    if artist = all.find {|artist| artist.name == name}
      artist
    else
      artist = self.new(name)
    end
  end
  
  def print_songs
    to_print = []
    Song.all.each do |song|
      if song.artist == self
        to_print << song.name
      end
    end
    puts to_print
  end
  
end