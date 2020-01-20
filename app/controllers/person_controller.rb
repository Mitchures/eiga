class PersonController < ApplicationController
  def show
    person = Tmdb::Person.detail(params[:person_id])
    person.films = Tmdb::Person.movie_credits(person.id).cast
    puts person.films
    @person = person
  end
end
