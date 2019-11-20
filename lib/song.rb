require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song 
  end 

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name 
    new_song
  end 

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song 
    new_song
  end 

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name 
    end 
  end 

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name) 
    end 
    find_by_name(name)
  end 

  def self.alphabetical
    @@all.sort_by do |song|
      song.name 
    end 
  end 

  def self.new_from_filename(file)
    p file 
    file.slice!(".mp3")
    file_info = file.split(" - ")
    new_song = self.create_by_name(file_info[1])
    new_song.artist_name = file_info[0]
    new_song
  end 

def self.create_from_filename(file)
    new_song = self.new_from_filename(file)
    @@all << new_song
end 

def self.destroy_all
  @@all = []
end 

end 
