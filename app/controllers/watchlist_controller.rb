class WatchlistController < ApplicationController
  def show
    if current_user.present?
      if current_user.watchlist.length >= 1
        watchlist = []
        for i in current_user.watchlist
          watchlist << Tmdb::Movie.detail(i)
        end
        @watchlist = watchlist
      end
    else
      redirect_to root_path
    end
  end
end
