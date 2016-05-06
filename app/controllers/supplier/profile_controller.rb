class Supplier::ProfileController < ApplicationController
  layout "application"
  def show
  end

  def edit
    @retailer_count = current_user.retailers.count
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: "User updated successfully"
    else
      render :edit
    end
  end

end
