class PhotosController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /photos
  # GET /photos.json
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.map { |p| p.json }
    @photo = Photo.new
    @album.add_one_view

   # @images = Dir.glob("app/assets/images/*.jpg")
   # pic_hash = @images.first(10).map { |i| {:pic_url => i}}
   # @photos = pic_hash.each_with_index.map {|i,v| {:photo_id => v.to_s + "1" }.merge(i) }

    respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @photos }
      end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @album = Album.find(params[:album_id])
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
   @album = Album.find(params[:album_id])
   #@photo = @album.photos.build(params[:photo])
   @photo = @album.photos.create(params[:photo])
   @album.cover_id ||= @photo.id
   @album.add_participator(current_user)


    respond_to do |format|
      if @photo.save & @album.save #&& @photo.exif_read
        format.html { redirect_to @album, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :ok }
    end
  end

  def vote
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    unless current_user.voted_for?(@photo)
      @photo.liked_by current_user
      @album.add_one_like
    end
  end

end
