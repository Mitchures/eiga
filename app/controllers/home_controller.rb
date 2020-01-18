class HomeController < ApplicationController
  def index
    @mnp = Tmdb::Movie.now_playing.results
    @tv = Tmdb::TV.airing_today.results
  end
end
