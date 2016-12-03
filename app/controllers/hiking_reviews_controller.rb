class HikingReviewsController < ApplicationController
  before_action :current_user_must_be_hiking_review_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_hiking_review_user
    hiking_review = HikingReview.find(params[:id])

    unless current_user == hiking_review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @hiking_reviews = HikingReview.page(params[:page]).per(10)

    render("hiking_reviews/index.html.erb")
  end

  def show
    @hiking_review = HikingReview.find(params[:id])

    render("hiking_reviews/show.html.erb")
  end

  def new
    @hiking_review = HikingReview.new

    render("hiking_reviews/new.html.erb")
  end

  def create
    @hiking_review = HikingReview.new

    @hiking_review.review_content = params[:review_content]
    @hiking_review.user_id = params[:user_id]
    @hiking_review.star_rating = params[:star_rating]

    save_status = @hiking_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hiking_reviews/new", "/create_hiking_review"
        redirect_to("/hiking_reviews")
      else
        redirect_back(:fallback_location => "/", :notice => "Hiking review created successfully.")
      end
    else
      render("hiking_reviews/new.html.erb")
    end
  end

  def edit
    @hiking_review = HikingReview.find(params[:id])

    render("hiking_reviews/edit.html.erb")
  end

  def update
    @hiking_review = HikingReview.find(params[:id])

    @hiking_review.review_content = params[:review_content]
    @hiking_review.user_id = params[:user_id]
    @hiking_review.star_rating = params[:star_rating]

    save_status = @hiking_review.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/hiking_reviews/#{@hiking_review.id}/edit", "/update_hiking_review"
        redirect_to("/hiking_reviews/#{@hiking_review.id}", :notice => "Hiking review updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Hiking review updated successfully.")
      end
    else
      render("hiking_reviews/edit.html.erb")
    end
  end

  def destroy
    @hiking_review = HikingReview.find(params[:id])

    @hiking_review.destroy

    if URI(request.referer).path == "/hiking_reviews/#{@hiking_review.id}"
      redirect_to("/", :notice => "Hiking review deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Hiking review deleted.")
    end
  end
end
