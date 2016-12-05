require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/Paramable'

class Artist
  attr_accessor :name
  attr_reader :songs
  extend Memorable::ClassMethods, Findable::ClassMethods
  include Paramable::InstanceMethods, Memorable::InstanceMethods


  ARTISTS = []

  # def self.find_by_name(name)
  #   self.all.detect{|a| a.name == name}
  # end

  def initialize
    super
    @songs = []
  end

  def self.all
    ARTISTS
  end

  # def self.reset_all
  #   self.all.clear
  # end

  # def self.count
  #   @@artists.count
  # end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end

end
