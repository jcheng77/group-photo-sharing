class Album < ActiveRecord::Base
  has_many :photos

  def json
    self.attributes.merge({"numOfPic" => self.photos.size})
  end

  def cover
    Photo.find(self.cover_id || self.photos.first.id)
  end

  def add_one_like
    self.likes ||= 0
    self.likes += 1
    puts self.likes
    self.save
  end

end
