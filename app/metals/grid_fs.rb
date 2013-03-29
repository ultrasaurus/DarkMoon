#
# This class is an easy and cheap way to retreive files
# with carrierwave that we can implement on heroku without
# much fuss. In the future it is recommended to migrate to a
# payed S3 account when we max out the storage of our free
# heroku node
#

class GridFs
  def initialize(app)
      @app = app
  end

  def call(env)
    Rails.logger.info env['PATH_INFO']
    if env["PATH_INFO"] =~ /^\/grid\/(.+)$/
      process_request(env, $1)
    else
      @app.call(env)
    end
  end

  private  
  def process_request(env, key)  
    begin
      file = CarrierWave::Storage::GridFS::File.new(AppVersionUploader.new, key)
      [200, { 'Content-Type' => file.content_type }, [file.read]]
    rescue Exception => e
      Rails.logger.error(e.inspect)
      [404, { 'Content-Type' => 'text/plain' }, ['Grid File not found.']]
    end
  end
end
