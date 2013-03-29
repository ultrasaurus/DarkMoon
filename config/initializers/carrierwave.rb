CarrierWave.configure do |config|
  config.grid_fs_access_url = "/grid"
  config.storage = :grid_fs
end