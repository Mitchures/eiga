class HomeController < ApplicationController
  def index
    if current_user.present?
      if current_user.watchlist.length >= 1
        watchlist = []
        for i in current_user.watchlist
          watchlist << Tmdb::Movie.detail(i)
        end
        @watchlist = watchlist
      end
    end
    @mnp = Tmdb::Movie.now_playing.results
    @anime = Tmdb::Keyword.movies(210024, page: params[:page]).results.first(3)
  end
end
