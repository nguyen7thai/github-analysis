class SessionsController < ApplicationController
  USERNAME = 'eastagile'
  PASSWORD = 'r,H+1,kea'

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
