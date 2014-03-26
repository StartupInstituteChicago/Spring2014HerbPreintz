class RestaurantsController < ApplicationController
	def new
		@restaurant = Restaurant.new
	end

	def create
		# render text: params[:restaurant].inspect
=begin
		@restaurant = Restaurant.new(params[:restaurant])
		@restaurant.save
		redirect_to @post
=end
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			redirect_to @restaurant
		else
			render 'new'
		end
    end

    def show
    	@restaurant = Restaurant.find(params[:id])
    end

    def index
    	@restaurant = Restaurant.all
    end

	def edit
 		 @restaurant = Restaurant.find(params[:id])
	end

	def update
	  @restaurant = Restaurant.find(params[:id])
	 
	  if @restaurant.update(params[:restaurant].permit(:name, :description))


	    redirect_to @restaurant
	  else
	    render 'edit'
	  end
	end	

def destroy
  @restaurant = Restaurant.find(params[:id])
  @restaurant.destroy
 
  redirect_to restaurants_path
end
	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :street_address, :city, :state, :zip_code, :phone_number)
	end


end
