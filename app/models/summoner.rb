class Summoner < ActiveRecord::Base
  has_many :matches
  validates_presence_of :name
end
