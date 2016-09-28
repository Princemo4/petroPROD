class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def dashboard_path
        if current_user.admin?
            admin_dashboard_path
        elsif current_user.retailer?
            retailer_dashboard_path
        elsif current_user.trucking?
            trucking_dashboard_path
        end
    end


    def set_slack
        require 'slack-ruby-client'
        Slack.configure do |config|
            config.token = ENV['SLACK_API_TOKEN']
        end
        @slack = Slack::Web::Client.new
    end

    def set_twilio
        require 'twilio-ruby'
        @from_phone = '+15005550006'
        @client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
    end


end
