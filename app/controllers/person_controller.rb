class PersonController < ApplicationController
  require 'date'

  def show
    person = Tmdb::Person.detail(params[:person_id])
    person.films = Tmdb::Person.movie_credits(person.id).cast
    person.birthday = "#{Date::MONTHNAMES[person.birthday.slice(5..6).to_i]} #{person.birthday.slice(8..9)}, #{person.birthday.slice(0..3)}"
    unless person.deathday.nil?
      person.deathday = "- #{Date::MONTHNAMES[person.deathday.slice(5..6).to_i]} #{person.deathday.slice(8..9)}, #{person.deathday.slice(0..3)}"
    end
    puts person.films
    @person = person
  end
end
