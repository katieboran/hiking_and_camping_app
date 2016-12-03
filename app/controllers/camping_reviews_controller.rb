class CampingReviewsController < ApplicationController
  before_action :current_user_must_be_camping_review_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_camping_review_user
    camping_review = CampingReview.find(params[:id])

    unless current_user == camping_review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @camping_reviews = CampingReview.all

    render("camping_reviews/index.html.erb")
  end

  def show
    @camping_review = CampingReview.find(params[:id])

    render("camping_reviews/show.html.erb")
  end

  def new
    @camping_review = CampingReview.new

    render("camping_reviews/new.html.erb")
  end

  def create
    @camping_review = CampingReview.new

    @camping_review.review_content = params[:review_content]
    @camping_review.user_id = params[:user_id]
    @camping_review.star_rating = params[:star_rating]

    save_status = @camping_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/camping_reviews/new", "/create_camping_review"
        redirect_to("/camping_reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "Camping review created successfully.")
      end
    else
      render("camping_reviews/new.html.erb")
    end
  end

  def edit
    @camping_review = CampingReview.find(params[:id])

    render("camping_reviews/edit.html.erb")
  end

  def update
    @camping_review = CampingReview.find(params[:id])

    @camping_review.review_content = params[:review_content]
    @camping_review.user_id = params[:user_id]
    @camping_review.star_rating = params[:star_rating]

    save_status = @camping_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/camping_reviews/#{@camping_review.id}/edit", "/update_camping_review"
        redirect_to("/camping_reviews/#{@camping_review.id}", :notice => "Camping review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Camping review updated successfully.")
      end
    else
      render("camping_reviews/edit.html.erb")
    end
  end

  def destroy
    @camping_review = CampingReview.find(params[:id])

    @camping_review.destroy

    if URI(request.referer).path == "/camping_reviews/#{@camping_review.id}"
      redirect_to("/", :notice => "Camping review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Camping review deleted.")
    end
  end
end
