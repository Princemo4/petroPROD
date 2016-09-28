class UsersController < ApplicationController
    before_action :set_twilio, only: [:create]
    before_action :set_slack, only: [:create]
    layout 'static_application'
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @client.messages.create(
                from: @from_phone,
                to: "#{@user.cell_number}",
                body: "Hey there! #{@user.first_name}. Thank you for signing up for  PetroHub. We will contact you shortly. If you have any questions please feel free to call us at 7329866193. thank you."
            )
            @slack.chat_postMessage(channel: '#new_signups', text: "#{@user.created_at.strftime('%F')} - New signup alert!! #{@user.first_name} from #{@user.business_name} just signed up for PetroHub account. More info, Email: #{@user.email}, Mobile: #{@user.cell_number}, Phone: #{@user.phone_number}, Business: #{@user.business_name}, Address: #{@user.street_address}, #{@user.city}, #{@user.state}, #{@user.zip_code}", as_user: true)
            flash[:notice] = 'Thank you for Applying for PetroHub account. We are currently reviewing your application, which might take upto 24hrs.'
            redirect_to new_user_path
        else
            flash[:alert] = 'Oops! something went wrong. Please check your application and resubmit. Thank you.'
            render 'new'
        end
    end

    def update
      if current_user.update(user_params)
        redirect_to supplier_profile_show_path, notice: "User updated successfully"
      else
        # FIXME change this to render instead of redirect_to and figure out how to render all the partials and layouts
        redirect_to supplier_profile_edit_path, alert: "Our appologies! Something didn't update properly. Please try again!"
      end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code, :tax_id, :ssn, :in_biz, :terms, :email, :password, :password_confirmation)
    end


end
