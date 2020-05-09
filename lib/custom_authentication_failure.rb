class CustomAuthenticationFailure < Devise::FailureApp 
    protected 
        def redirect_url 
            items_path
        end 
end 
