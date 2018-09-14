class AlbumsController < ApplicationController

  def new
    @band = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    debugger
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      render json: @album.errors.full_messages
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def album_params
    params.require(:albums).permit(:title, :year, :band_id, :live?)
  end
end
