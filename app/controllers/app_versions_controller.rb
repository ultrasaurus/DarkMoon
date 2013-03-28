class AppVersionsController < ApplicationController
  def create
    o = AppVersion.create({"bundle_identifier" => params[:bundle_identifier], 
                       "bundle_version"    => params[:bundle_version],
                       "title"             => params[:title]
                      })
    render :json => o
  end
end
