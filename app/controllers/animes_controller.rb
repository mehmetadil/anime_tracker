class AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def search
    @animes = Kitsu::AnimeApi.index(q: params[:q])
    render :search, layout: false
  end
end
