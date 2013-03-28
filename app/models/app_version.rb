class AppVersion
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :bundle_identifier
  field :bundle_version
  field :title
  field :file_reference
  field :icon
  field :downloaded_at, type: DateTime
end