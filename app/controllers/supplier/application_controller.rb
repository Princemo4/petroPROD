class Supplier::ApplicationController < LoginrequiredController
    before_action :authenticate_supplier!

    private



    def authenticate_supplier!
        unless current_user.supplier?
            redirect_to dashboard_path, alert: 'You are not authorized to access that section.'
        end
    end
end
