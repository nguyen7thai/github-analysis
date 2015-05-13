class SessionsController < ApplicationController
  USERNAME = ENV['login_username']
  PASSWORD = ENV['login_password']

  def new
  end

  def create
    if params[:username] == USERNAME && params[:password] == PASSWORD
      session[:current_user] = USERNAME
      redirect_to repositories_path
    else
      unauthenticate!
    end
  end
end
