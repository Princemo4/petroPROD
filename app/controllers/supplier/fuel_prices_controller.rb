class Supplier::FuelPricesController < Supplier::ApplicationController
before_action :set_fuel_price, only: [:edit, :update]

  def index
    @fuel_prices = current_user.fuel_prices.all.order("created_at DESC")
    @latest_fuel_price = current_user.fuel_prices.last
  end

  def new
    @fuel_price = current_user.fuel_prices.build
  end

  def create
    @fuel_price = current_user.fuel_prices.build(fuel_price_params)
    if @fuel_price.save
      unless current_user.contacts.empty?
      current_user.contacts.each do |contact|
        contact.retail_prices.create(r_regular: current_user.fuel_prices.last.regular + contact.c_regular,
                                    r_medium: current_user.fuel_prices.last.medium + contact.c_medium,
                                    r_premium: current_user.fuel_prices.last.premium + contact.c_premium,
                                    r_diesel: current_user.fuel_prices.last.diesel + contact.c_diesel
                                  )
       end
     end
      flash[:notice] = "You have successfully Added new Fuel Price."
      redirect_to supplier_fuel_prices_path
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      render "new"

    end
  end

  def edit
  end

  def update
    if @fuel_price.update(fuel_price_params)
      unless current_user.contacts.empty?
      current_user.contacts.each do |contact|
        contact.retail_prices.create(r_regular: current_user.fuel_prices.last.regular + contact.c_regular,
                                    r_medium: current_user.fuel_prices.last.medium + contact.c_medium,
                                    r_premium: current_user.fuel_prices.last.premium + contact.c_premium,
                                    r_diesel: current_user.fuel_prices.last.diesel + contact.c_diesel
                                  )
       end
     end
      flash[:notice] = "Fuel Price has been successfully updated"
      redirect_to supplier_fuel_prices_path
    else
      flash.now[:alert]= "Something went wrong. Please try again"
      render 'edit'
    end
  end

  private

  def fuel_price_params
    params.require(:fuel_price).permit(:regular, :medium, :premium, :diesel)
  end

  def set_fuel_price
    @fuel_price = FuelPrice.find(params[:id])
  end
end
