class SearchController < ApplicationController

  def show
    query = Tmdb::Search.movie(params[:query], page: params[:page])
    query.user_input = params[:query]
    query.current_page = params[:page].to_i
    img_url_path = "https://image.tmdb.org/t/p/w780/"
    query.results.each do |i|
      if i.backdrop_path.nil?
        if i.poster_path.nil?
          i.backdrop_path = ""
        else
          i.backdrop_path = img_url_path + i.poster_path
        end
      else
        i.backdrop_path = img_url_path + i.backdrop_path
      end
    end
    @search = query
  end

  #def show
  #  query = Tmdb::Search.keyword(params[:query])
  #  puts query
  #  a = []
  #  query.results.each do |item|
  #    search_item = Tmdb::Keyword.movies(item.id)
  #    puts search_item
  #    img_url_path = "https://image.tmdb.org/t/p/w500/"
  #    no_img_url_path = "http://www.saxarchitecten.nl/wp-content/uploads/2015/07/film_camera.png.625x385_q100.png"
  #    search_item.results.each do |i|
  #      if i.backdrop_path.nil?
  #        if i.poster_path.nil?
  #          i.backdrop_path = no_img_url_path
  #        else
  #          i.backdrop_path = img_url_path + i.poster_path
  #        end
  #      else
  #        i.backdrop_path = img_url_path + i.backdrop_path
  #      end
  #      a << i
  #    end
  #  end
  #  query.results = a
  #  puts query
  #  query.user_input = params[:query]
  #  query.current_page = params[:page].to_i
  #  @search = query
  #end
end
