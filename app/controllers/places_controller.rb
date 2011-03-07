#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class PlacesController < ApplicationController
  # GET /places
  # GET /places.xml
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])
    @map = @place.get_place_map

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new
    @filming = @place.filmings.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
    @filming = @place.filmings.build
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        @filming = @place.filmings.create(:movie_id => params[:filming][:movie_id])
        Hosting.create(:movie_id => params[:filming][:movie_id], :city_id => @place.city_id)
        format.html { redirect_to(@place, :notice => 'Place was successfully created.') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        @filming = @place.filmings.build(:movie_id => params[:filming][:movie_id])
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])
    Filming.find(:first, :conditions => ["place_id = ?", @place.id]).destroy
    @filming = @place.filmings.build(:movie_id => params[:filming][:movie_id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        Hosting.create(:movie_id => params[:filming][:movie_id], :city_id => @place.city_id)
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end

  def add_place
    @city = City.find_by_id(params[:id])
    @filming = @city.filmings.build
    @place = Place.new
  end
end
