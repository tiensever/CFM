#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class MoviesController < ApplicationController
  # GET /movies
  # GET /movies.xml
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.xml
  def show
    @movie = Movie.find(params[:id])
    @map = @movie.get_all_cities_map

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.xml
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
    @hosting = @movie.hostings.build
  end

  # POST /movies
  # POST /movies.xml
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to(@movie, :notice => 'Movie was successfully created.') }
        format.xml  { render :xml => @movie, :status => :created, :location => @movie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @movie = Movie.find(params[:id])
    @hosting = @movie.hostings.build(:city_id => params[:hosting][:city_id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to(@movie, :notice => 'Movie was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to(movies_url) }
      format.xml  { head :ok }
    end
  end

  def add_place
    @movie = Movie.find_by_id(params[:id])
    @filming = @movie.filmings.build
    @place = Place.new
  end

  def update_add_place
    @movie = Movie.find_by_id(params[:id])
    @movie.filmings.create(:place_id => params[:filming][:place_id])
    place = Place.find_by_id(params[:filming][:place_id])
    @hosting = @movie.hostings.create(:city_id => place.city_id)

    redirect_to(@movie, :notice => 'Movie was successfully associated to an existing place.')
  end

  def update_add_new_place
    @movie = Movie.find_by_id(params[:id])
    @place = Place.new(params[:place])

    if @place.save
      @movie.filmings.create(:place_id => @place.id)
      @movie.hostings.create(:city_id => @place.city_id)

      redirect_to(@movie, :notice => 'Movie was successfully associated to new place.')
    else
      @filming = @movie.filmings.build
      render :action => 'add_place'
    end
  end
end
