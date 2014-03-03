class Album
  include Mongoid::Document

  has_many :photos


end
