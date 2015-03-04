class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  # before_filter is the same thing

  def index
    #@songs = Song.all
    @songs = current_user.songs
  end

  def new
    @song = Song.new
  end

  def show
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    #@song = Song.find(params[:id])
    @song = current_user.songs.find(params[:id])
  end

  def logged_in?
    unless current_user
      flash[:notice] = "Please login first"
      redirect_to login_path
    end
  end
end
