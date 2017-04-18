class ApplicationController < ActionController::Base
  before_filter :set_cache_headers
    private

    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
    def authenticate_user!
      if current_user

      else
        redirect_to login_path, :notice => 'if you want to add a notice'
        ## if you want render 404 page
        ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      end
    end

end
