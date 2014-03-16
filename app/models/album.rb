class Album < ActiveRecord::Base
  has_many :photos
  has_and_belongs_to_many :user

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

  def add_participator(u)
    self.user << u
  end

  def add_one_view
    begin
      self.views ||= 0
      self.views += 1
      self.save
    rescue => e
      logger.warn "didn't add view count for album #{self.id} -- ignore: #{e}"
    end
  end

end
