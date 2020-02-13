class SearchController < ApplicationController

  def show
    query = Tmdb::Search.multi(params[:query], page: params[:page])
    puts query
    a = []
    query.user_input = params[:query]
    img_url_path = "https://image.tmdb.org/t/p/w780/"
    no_img_url_path = "http://www.saxarchitecten.nl/wp-content/uploads/2015/07/film_camera.png.625x385_q100.png"
    query.results.each do |item|
      puts item.media_type
      search_item = ""
      if item.media_type == "movie"
        search_item = Tmdb::Movie.detail(item.id)
      elsif item.media_type == "tv"
        search_item = Tmdb::TV.detail(item.id)
      elsif item.media_type == "person"
        search_item = Tmdb::Person.detail(item.id)
      end
      if search_item.backdrop_path.nil?
        if search_item.poster_path.nil?
          search_item.backdrop_path = no_img_url_path
        else
          search_item.backdrop_path = img_url_path + search_item.poster_path
        end
      else
        search_item.backdrop_path = img_url_path + search_item.backdrop_path
      end
      a << search_item
    end
    query.results = a
    query.user_input = params[:query]
    query.current_page = params[:page].to_i
    @search = query
  end

end
