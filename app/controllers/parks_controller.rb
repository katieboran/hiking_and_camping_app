class ParksController < ApplicationController
  def index
    @q = Park.ransack(params[:q])
    @parks = @q.result(:distinct => true).includes(:state, :hiking_trails, :camping_sites).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@parks.where.not(:address_latitude => nil)) do |park, marker|
      marker.lat park.address_latitude
      marker.lng park.address_longitude
      marker.infowindow "<h5><a href='/parks/#{park.id}'>#{park.created_at}</a></h5><small>#{park.address_formatted_address}</small>"
    end

    render("parks/index.html.erb")
  end

  def show
    @camping_site = CampingSite.new
    @hiking_trail = HikingTrail.new
    @park = Park.find(params[:id])

    render("parks/show.html.erb")
  end

  def new
    @park = Park.new

    render("parks/new.html.erb")
  end

  def create
    @park = Park.new

    @park.state_id = params[:state_id]
    @park.address = params[:address]
    @park.dates_of_operation = params[:dates_of_operation]
    @park.image = params[:image]
    @park.activities = params[:activities]

    save_status = @park.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/parks/new", "/create_park"
        redirect_to("/parks")
      else
        redirect_back(:fallback_location => "/", :notice => "Park created successfully.")
      end
    else
      render("parks/new.html.erb")
    end
  end

  def edit
    @park = Park.find(params[:id])

    render("parks/edit.html.erb")
  end

  def update
    @park = Park.find(params[:id])

    @park.state_id = params[:state_id]
    @park.address = params[:address]
    @park.dates_of_operation = params[:dates_of_operation]
    @park.image = params[:image]
    @park.activities = params[:activities]

    save_status = @park.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/parks/#{@park.id}/edit", "/update_park"
        redirect_to("/parks/#{@park.id}", :notice => "Park updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Park updated successfully.")
      end
    else
      render("parks/edit.html.erb")
    end
  end

  def destroy
    @park = Park.find(params[:id])

    @park.destroy

    if URI(request.referer).path == "/parks/#{@park.id}"
      redirect_to("/", :notice => "Park deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Park deleted.")
    end
  end
end
