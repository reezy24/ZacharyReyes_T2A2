class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters

        # Permit the `subscribe_newsletter` parameter along with the other
        # sign up parameters.
        params = devise_parameter_sanitizer.permit(
            :account_update, 
            keys: [
                :first_name, :last_name, :about_me,
                member_expertises_attributes: [:expertise, :description]
            ]
        )
        p "Devise params: #{params}"
    end
end
