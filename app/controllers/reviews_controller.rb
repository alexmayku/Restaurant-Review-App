class ReviewsController < ApplicationController

	def index
		#this is our list page for our reviews
		@price = params[:price]
		@cuisine = params[:cuisine]
		@location = params[:location]

		#start with all the Reviews
		@reviews = Review.all

		#filtering by price
		if @price.present?
			@reviews = @reviews.where(price: @price)
		end

		#filter by Cuisine

		if @cuisine.present?
			@reviews = @reviews.where(cuisine: @cuisine)
		end

		#search near location
		if @location.present?
			@reviews = @reviews.near(@location)
		end

	end


	def new
		# the form for adding a new review
		@review = Review.new
	end

  def create
    # take info from the form and add it to the model
    @review = Review.new(form_params)

    # we want to check if the model can be saved
    # if it is, we're go the home page again
    # if it isn't, show the new form
    if @review.save
      redirect_to root_path
    else
      # show the view for new.html.erb
      render "new"
    end




	end

	def show
		#individual review page
		@review = Review.find(params[:id])
	end

	def destroy
		# find the individual review
		@review = Review.find(params[:id])
		# destroy it
		@review.destroy
		# redirect to the homepage
		redirect_to root_path

	end

	def edit

		#find the individual review to edit
		@review = Review.find(params[:id])

	end

	def update
		#find the individual review
		@review = Review.find(params[:id])

		# update it with the new info from the form
		if @review.update(form_params)
		redirect_to review_path(@review)

		else
			render "edit"
		end

	end

	def form_params
		params.require(:review).permit(:title, :restaurant, :body, :score, :ambience, :cuisine, :price, :address)
	end



end
