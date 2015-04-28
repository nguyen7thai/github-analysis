class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_logged_in
    if session[:current_user]
      @current_user = session[:current_user]
    else
      unauthenticate!
    end
  end

  def unauthenticate!
    return render :file => "public/401.html", :status => :unauthorized
  end
end
