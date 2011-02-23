#
# Giang NGUYEN
# ndgiang84@gmail.com
# Hanoi, Feb-2011
#

class CitiesController < ApplicationController
  # GET /cities
  # GET /cities.xml
  def index
    @cities = City.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cities }
    end
  end

  # GET /cities/1
  # GET /cities/1.xml
  def show
    @city = City.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/new
  # GET /cities/new.xml
  def new
    @city = City.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/1/edit
  def edit
    @city = City.find(params[:id])
    @hosting = @city.hostings.build
  end

  # POST /cities
  # POST /cities.xml
  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.html { redirect_to(@city, :notice => 'City was successfully created.') }
        format.xml  { render :xml => @city, :status => :created, :location => @city }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.xml
  def update
    @city = City.find(params[:id])
    @hosting = @city.hostings.build(:movie_id => params[:hosting][:movie_id])

    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.html { redirect_to(@city, :notice => 'City was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.xml
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to(cities_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_place
    @city = City.find_by_id(params[:id])
    @place = @city.places.build
  end

  def update_add_new_place
    @city = City.find_by_id(params[:id])
    @place = @city.places.build(params[:place])

    if @place.save 
      redirect_to(@city, :notice => "Place was successfully added to city.")
    else
      render :action => "add_place"
    end
  end
end
