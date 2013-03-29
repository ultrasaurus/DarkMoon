class AppVersion
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :file, AppVersionUploader
  mount_uploader :icon, AppVersionUploader

  field :bundle_identifier
  field :bundle_version
  field :title
  field :downloaded_at, type: DateTime
end