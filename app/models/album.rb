class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :user

  def json
    self.attributes.merge({"numOfPic" => self.photos.size, "cover_url" => cover.nil? ? nil : cover.file.url })
  end

  def cover
    Photo.find(self.cover_id) if self.cover_id
  end

  def add_one_like
    self.likes ||= 0
    self.likes += 1
    puts self.likes
    self.save
  end

end
