class Album < ActiveRecord::Base
  has_many :photos
  has_one :cover, :class_name => "Photo"
  accepts_nested_attributes_for :cover

  def json
    self.attributes.merge({"numOfPic" => self.photos.size, "cover_id" => self.cover.id})
  end

  def add_one_like
    self.likes ||= 0
    self.likes += 1
    puts self.likes
    self.save
  end

end
