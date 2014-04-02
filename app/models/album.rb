class Album < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_many :photos
  has_and_belongs_to_many :user



  def json
    self.attributes.merge({"numOfPic" => self.photos.size, "cover_url" => cover.nil? ? nil : cover.file.url })
  end

  def cover
    Photo.find(self.cover_id) if self.cover_id
  end

  def self.search(key)
    if key
      find(:all, :conditions => ['title LIKE ?', "%#{key}%"])
    else
      find(:all)
    end
  end

  def add_one_like
    self.likes ||= 0
    self.likes += 1
    puts self.likes
    self.save
  end

  def add_participator(u)
    self.user << u unless self.user.include?(u)
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

  def qr_code_img(url)
    qr = RQRCode::QRCode.new( url, :size => 4, :level => :h )
    return qr.to_img
  end

end
