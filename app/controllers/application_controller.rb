class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    layout :layout_by_resource

    def layout_by_resource
        user_signed_in? ?  "application" : "my_devise_layout" 
    end
end
