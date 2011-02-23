#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class DrillDownController < ApplicationController
  def index
  end

  def filming_movie
    movie_id = params[:movie_id]
    city_id = params[:city_id]
    place_id = params[:place_id]

    if movie_id.blank? || city_id.blank? || place_id.blank? 
      redirect_to drill_down_index_path, :notice => 'Must choose movie, city and place.'
      return
    end

    Movie.film_in_place(movie_id, place_id)
    redirect_to drill_down_index_path, :notice => "#{Movie.find_by_id(movie_id).name} was filmed in #{Place.find_by_id(place_id).name}, #{City.find_by_id(city_id).name}"
  end

  def associated_cities
    associated_cities = Movie.find_associated_cities(params[:id])
    cities_select_content = render_to_string :partial => "cities_select_content", :locals => { :city_options => associated_cities }
    render :text => cities_select_content
  end

  def associated_places
    associated_places = City.find_associated_places(params[:id])
    places_select_content = render_to_string :partial => "places_select_content", :locals => { :place_options => associated_places }
    render :text => places_select_content
  end
end
