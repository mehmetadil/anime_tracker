class AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def search
    @anime = Anime.first

    respond_to do |format|
      format.json { render json: @anime }
    end
  end
end
