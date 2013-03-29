class AppVersionsController < ApplicationController
  def create
    app_version = AppVersion.create({"bundle_identifier" => params[:bundle_identifier], 
                           "bundle_version"    => params[:bundle_version],
                           "title"             => params[:title]
                          })
    render :json => app_version
  end
end
