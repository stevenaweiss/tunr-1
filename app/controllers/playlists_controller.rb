class PlaylistsController < ApplicationController
  before_action :load_user, only: [:new, :create]

  def index
    #@playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end



  def create
    #binding.pry
    @playlist = @user.playlists.create(title: params[:playlist][:title])
    @playlist.purchases << @user.purchases.where( 
      song_id: params[:playlist][:songs]
    )
    
    redirect_to playlist_path(@playlist)
  end

  def show
    @playlist = Playlist.find_by(id: params[:id])
  end

  private

  def load_user
    @user = User.find_by(id: params[:user_id])
  end
end