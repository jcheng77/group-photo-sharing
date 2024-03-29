class AlbumsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
    @albums_json = @albums.map {|a| a.json} 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums_json }
    end
  end

  def search
    @albums = Album.search(params[:key])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums}
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
    @url = request.host_with_port + request.fullpath

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])
    @album.creator = current_user.id if @album.user.empty?
    @album.user << current_user

    respond_to do |format|
      if @album.save
        format.html { redirect_to album_photos_path(@album), notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])


    respond_to do |format|
      if @album.update_attributes(params[:album]) && @album.save
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :ok }
    end
  end

  def mine
    @albums = current_user.albums

    respond_to do |format|
      format.html
      format.json
    end
  end

end
