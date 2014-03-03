class AlbumsController < ApplicationController

  def index 

    album1 = { :album_id => 123, :photo_num => 10, :creator => 'jcheng7', :creation_date => Time.now , :cover_photo => 333, :description => 'the very first album' }
    album2 = { :album_id => 222, :photo_num => 20, :creator => 'jcheng', :creation_date => Time.now , :cover_photo => 233, :description => 'the second album' }
    @albums = [ album1, album2 ]

    respond_to do |format|
      format.html 
      format.json { render :json => @albums.to_json }
    end
  end

  
end
