class Users::RegistrationsController < Devise::RegistrationsController

    protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def account_update_params
      devise_parameter_sanitizer.sanitize(:account_update)
    end
end
