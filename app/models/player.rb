class Player < ActiveRecord::Base
  # Remember to create a migration!
  has_and_belongs_to_many :games
  validates_uniqueness_of :initials
  validates_presence_of :initials

end
