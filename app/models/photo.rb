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
    self.attributes.merge("url" => self.file.url, "image_scale" => scale )
  end


  def scale
    unless self.image_size.nil?
      height, weight = self.image_size.split('x')
      "1 :" + ( weight.to_f / height.to_f ).round(2).to_s
    end
  end


end
