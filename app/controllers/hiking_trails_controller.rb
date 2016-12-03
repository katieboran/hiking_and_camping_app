class HikingTrailsController < ApplicationController
  def index
    @hiking_trails = HikingTrail.all
    @location_hash = Gmaps4rails.build_markers(@hiking_trails.where.not(:address_latitude => nil)) do |hiking_trail, marker|
      marker.lat hiking_trail.address_latitude
      marker.lng hiking_trail.address_longitude
      marker.infowindow "<h5><a href='/hiking_trails/#{hiking_trail.id}'>#{hiking_trail.created_at}</a></h5><small>#{hiking_trail.address_formatted_address}</small>"
    end

    render("hiking_trails/index.html.erb")
  end

  def show
    @hiking_trail = HikingTrail.find(params[:id])

    render("hiking_trails/show.html.erb")
  end

  def new
    @hiking_trail = HikingTrail.new

    render("hiking_trails/new.html.erb")
  end

  def create
    @hiking_trail = HikingTrail.new

    @hiking_trail.address = params[:address]
    @hiking_trail.distance = params[:distance]
    @hiking_trail.difficulty = params[:difficulty]
    @hiking_trail.park_id = params[:park_id]
    @hiking_trail.review_id = params[:review_id]

    save_status = @hiking_trail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hiking_trails/new", "/create_hiking_trail"
        redirect_to("/hiking_trails")
      else
        redirect_back(:fallback_location => "/", :notice => "Hiking trail created successfully.")
      end
    else
      render("hiking_trails/new.html.erb")
    end
  end

  def edit
    @hiking_trail = HikingTrail.find(params[:id])

    render("hiking_trails/edit.html.erb")
  end

  def update
    @hiking_trail = HikingTrail.find(params[:id])

    @hiking_trail.address = params[:address]
    @hiking_trail.distance = params[:distance]
    @hiking_trail.difficulty = params[:difficulty]
    @hiking_trail.park_id = params[:park_id]
    @hiking_trail.review_id = params[:review_id]

    save_status = @hiking_trail.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hiking_trails/#{@hiking_trail.id}/edit", "/update_hiking_trail"
        redirect_to("/hiking_trails/#{@hiking_trail.id}", :notice => "Hiking trail updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Hiking trail updated successfully.")
      end
    else
      render("hiking_trails/edit.html.erb")
    end
  end

  def destroy
    @hiking_trail = HikingTrail.find(params[:id])

    @hiking_trail.destroy

    if URI(request.referer).path == "/hiking_trails/#{@hiking_trail.id}"
      redirect_to("/", :notice => "Hiking trail deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Hiking trail deleted.")
    end
  end
end
