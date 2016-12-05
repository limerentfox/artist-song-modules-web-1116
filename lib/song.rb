require 'pry'
require_relative '../lib/concerns/memorable'

class Song
  extend Memorable::ClassMethods
  attr_accessor :name
  attr_reader :artist

  SONGS = []

  def initialize
    SONGS << self
  end

  def self.find_by_name(name)
    SONGS.detect{|a| a.name == name}
  end

  def artist=(artist)
    @artist = artist
  end

  # def self.reset_all
  #   @@songs.clear
  # end

  def to_param
    name.downcase.gsub(' ', '-')
  end

  # def self.count
  #   self.all.count
  # end

  def self.all
    SONGS
  end
end
