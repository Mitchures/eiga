class HomeController < ApplicationController
  def index
    @mnp = Tmdb::Movie.now_playing.results
    @anime = Tmdb::Keyword.movies(210024, page: params[:page]).results.first(3)
  end
end
