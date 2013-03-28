class HomeController < ApplicationController
  before_filter :volunteer_connect , :only => :index
  before_filter :protect_applications, :only => :applications

  def auth_path(service_name)
     url = "/auth/singly?service=#{service_name}"
     url += "&access_token=#{session[:singly_access_token]}" if session[:singly_access_token]
     url
   end

  def volunteer_connect
    if DM::Singly.build('github', session[:singly_access_token]).success?
      redirect_to '/applications'
    else
      true
    end
  end
  
  def protect_applications
    if !DM::Singly.build('github', session[:singly_access_token]).success?
      redirect_to '/'
    end
  end
    
  def index
  end
  
  def connect
    redirect_to auth_path(params[:service])
  end
  
  def callback
    session[:singly_access_token] = request.env["omniauth.auth"].credentials.token   
    redirect_to '/applications'
  end
  
  def disconnect
    reset_session
    redirect_to '/'
  end
  
  # needs protection
  def applications
  end
end
