require 'pry'
class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
    @preference = Preference.first #only one preference.
    if @preference && !@preference.allow_create_artists
      redirect_to artists_path
    end
    #if params[:artist_id] && !Artist.exists?(params[:artist_id])
     # redirect_to artists_path, alert: "Artist not found."
    #else
     # @artist = Artist.new(artist_id: params[:artist_id])
    #end
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
