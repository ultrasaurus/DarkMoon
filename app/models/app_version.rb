class AppVersion
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :file, AppVersionUploader
  mount_uploader :icon, AppVersionUploader

  field :bundle_identifier
  field :title
  field :downloaded_at, type: DateTime
  
  validates_uniqueness_of :bundle_identifier, :file  #  file is not field - shim AppVersionUploader??
  validates_presence_of :bundle_identifier
end