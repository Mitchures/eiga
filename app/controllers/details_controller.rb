class DetailsController < ApplicationController
  require 'date'

  def show
    details = Tmdb::Movie.detail(params[:id])
    details.cast = Tmdb::Movie.cast(params[:id])
    details.reviews = Tmdb::Movie.reviews(params[:id]).results
    details.backdrops = Tmdb::Movie.backdrops(params[:id])
    details.id = params[:id]
    release = details.release_date
    if release.nil? || release == ''
      details.release_date = 'TBD'
    else
      details.release_date = "#{Date::MONTHNAMES[release.slice(5..6).to_i]} #{release.slice(8..9)}, #{release.slice(0..3)}"
    end
    unless details.runtime.nil?
      details.runtime = time_conversion(details.runtime)
    end
    if details.backdrop_path != nil
      details.backdrop_path = details.backdrops[0].file_path
      #details.backdrop_path = details.backdrops[rand(0..(details.backdrops.length - 1))].file_path
    else
      details.backdrop_path = details.poster_path
    end
    @film = details
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    return hours != 0 ? "#{hours}h #{rest}m" : "#{rest}m"
  end

  def add_to_watchlist
    if current_user.watchlist.include? params[:movie_id].to_i
      current_user.watchlist.delete(params[:movie_id].to_i)
    else
      current_user.watchlist << params[:movie_id]
    end
    current_user.save
    redirect_to details_path(:id => params[:movie_id])
  end

end
