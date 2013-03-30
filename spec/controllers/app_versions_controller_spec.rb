require 'spec_helper'

describe AppVersionsController do
  describe "POST #create" do
    it 'creates an app version' do
      params = {"bundle_identifier" => 'A1', "title" => 'app'}
      mock(AppVersion).create(params)
      post :create, params
    end
  end
end
