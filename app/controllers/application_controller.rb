class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:password,:password_confirmation,:last_name,:first_name,
                                                           :last_name_kana,:first_name_kana,:postcode,:prefecture_name,:address_city,
                                                           :address_street,:address_building,:telephone_number])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email,:password,:password_confirmation,:last_name,:first_name,
                                                           :last_name_kana,:first_name_kana,:postcode,:prefecture_name,:address_city,
                                                           :address_street,:address_building,:telephone_number])
    end
end
