class CampingSitesController < ApplicationController
  def index
    @q = CampingSite.ransack(params[:q])
    @camping_sites = @q.result(:distinct => true).includes(:park, :camping_review).page(params[:page]).per(10)

    render("camping_sites/index.html.erb")
  end

  def show
    @camping_site = CampingSite.find(params[:id])

    render("camping_sites/show.html.erb")
  end

  def new
    @camping_site = CampingSite.new

    render("camping_sites/new.html.erb")
  end

  def create
    @camping_site = CampingSite.new

    @camping_site.capacity = params[:capacity]
    @camping_site.review_id = params[:review_id]
    @camping_site.park_id = params[:park_id]

    save_status = @camping_site.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/camping_sites/new", "/create_camping_site"
        redirect_to("/camping_sites")
      else
        redirect_back(:fallback_location => "/", :notice => "Camping site created successfully.")
      end
    else
      render("camping_sites/new.html.erb")
    end
  end

  def edit
    @camping_site = CampingSite.find(params[:id])

    render("camping_sites/edit.html.erb")
  end

  def update
    @camping_site = CampingSite.find(params[:id])

    @camping_site.capacity = params[:capacity]
    @camping_site.review_id = params[:review_id]
    @camping_site.park_id = params[:park_id]

    save_status = @camping_site.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/camping_sites/#{@camping_site.id}/edit", "/update_camping_site"
        redirect_to("/camping_sites/#{@camping_site.id}", :notice => "Camping site updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Camping site updated successfully.")
      end
    else
      render("camping_sites/edit.html.erb")
    end
  end

  def destroy
    @camping_site = CampingSite.find(params[:id])

    @camping_site.destroy

    if URI(request.referer).path == "/camping_sites/#{@camping_site.id}"
      redirect_to("/", :notice => "Camping site deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Camping site deleted.")
    end
  end
end
