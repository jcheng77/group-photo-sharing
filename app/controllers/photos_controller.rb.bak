class PhotosController < ApplicationController
  def index
    @images = Dir.glob("app/assets/images/*.jpg")
    pic_hash = @images.first(10).map { |i| {:pic_url => i}}
    @photos = pic_hash.each_with_index.map {|i,v| {:photo_id => v.to_s + "1" }.merge(i) }

   respond_to do |format|
     format.html 
     format.json { render :json => @photos.to_json }
   end
  end

  end
