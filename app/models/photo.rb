require 'mini_exiftool'

class Photo < ActiveRecord::Base
  attr_accessible :file, :time
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  belongs_to :album


  def exif_read
    p = MiniExiftool.new(self.file.path)
    puts p[:datetimeoriginal]
  end


end
