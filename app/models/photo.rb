require 'mini_exiftool'

class Photo < ActiveRecord::Base
  acts_as_votable
  attr_accessible :file, :datetime_original, :image_size
  has_attached_file :file#, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  belongs_to :album



  def exif_read
    p = MiniExiftool.new(self.file.path)
    self.update_attributes(:datetime_original => p[:datetimeoriginal] , :image_size => p[:imagesize])
  end

  def json
    self.attributes.merge("url" => self.file.url)
  end


end
