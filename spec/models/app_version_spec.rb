require 'spec_helper'

describe AppVersion do
  let(:correct_params) do
    { "title" => 'app1', "bundle_identifier" => '001A', "file" => "i should be a file" } 
  end
  
  
  
  it 'should validate the prescence of a bundle identifier' do
    app = AppVersion.new( correct_params.delete(:bundle_identifier) )
    app.valid?.should == false
  end
  
  it 'should validate uniqueness of a bundle identifier' do
    app1 = AppVersion.create( correct_params )
    app2 = AppVersion.create( correct_params )
    app2.valid?.should == false
  end
  
  it 'should validate the prescence of a file' do
    app = AppVersion.new( correct_params.delete(:file) )
    app.valid?.should == false
  end
  
  it 'should validate uniqueness of a bundle identifier' do
    app1 = AppVersion.create( correct_params )
    app2 = AppVersion.create( correct_params )
    app2.valid?.should == false
  end
  
end