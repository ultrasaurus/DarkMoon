require 'spec_helper'

describe "GridFs" do
  let(:file) do
    filename = '/Draw.ipa'
    fixture_file_upload(filename, 'application/octet-stream')
  end
  
  it "serves a file from grid fs" do
      app_version = AppVersion.create(:title => 'Draw',
                                      :file => file)
      get app_version.file.url

      response.content_type.should == 'application/octet-stream'
      response.status.should_not == :file_not_found
  end
end
