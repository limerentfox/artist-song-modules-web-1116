require 'pry'
require_relative '../lib/concerns/memorable'

class Artist
  attr_accessor :name
  attr_reader :songs
  extend Memorable::ClassMethods

  ARTISTS = []

  def self.find_by_name(name)
    ARTISTS.detect{|a| a.name == name}
  end

  def initialize
    ARTISTS << self
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

  def to_param
    name.downcase.gsub(' ', '-')
  end

end
