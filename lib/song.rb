require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song  
  end

   def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
   end

   def self.find_or_create_by_name(name)
    if self.all.find {|song| song.name == name}
     song
    else
      song = self.new
      @@all << self.new
    end
      song
   end

   def self.alphabetical
      self.all.sort_by {|song| song.name}   
   end




   def self.new_from_filename(filename)
    data = filename.chomp!(".mp3").split(" - ")
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song 
   end

   def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
   end



   def self.destroy_all
    @@all.clear
  end


  def save
    self.class.all << self
  end

end
