require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/Paramable'

class Song
  extend Memorable::ClassMethods, Findable::ClassMethods
  include Paramable::InstanceMethods, Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist

  SONGS = []

  # def initialize
  #   self.class.all << self
  # end

  # def self.find_by_name(name)
  #   self.all.detect{|a| a.name == name}
  # end

  def artist=(artist)
    @artist = artist
  end

  # def self.reset_all
  #   @@songs.clear
  # end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end

  # def self.count
  #   self.all.count
  # end

  def self.all
    SONGS
  end
end
