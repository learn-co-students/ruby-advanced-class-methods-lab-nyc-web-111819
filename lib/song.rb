require "pry"

class Song
  attr_accessor :artist_name, :name
  @@all = []
  def self.create
    song = self.new
    @@all << song
    return song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  def self.find_by_name(name)
    @@all.find{|songname| name == songname.name}
  end
  def self.find_or_create_by_name(name)
    dummy = Song.find_by_name(name)
    if !!dummy
      return dummy
    else
      create_by_name(name)
    end
  end
  def self.alphabetical()
    @@all.sort_by!{|a| a.name[0]}
  end
  def self.all
    @@all
  end
  def self.new_from_filename(filename)
    array = filename.split(".")
    song = self.new_by_name(array[0].split(" ")[2..].join(" "))
    song.artist_name = array[0].split(" ")[0]
    song
  end
  def self.create_from_filename(filename)
    array = filename.split(".")
    song = self.create_by_name(array[0].split(" ")[2..].join(" "))
    song.artist_name = array[0].split(" ")[0]
    song
  end
  def save
    self.class.all << self
  end
  def self.destroy_all()
    @@all = []
  end
end
