module DM
  class Singly
    attr_accessor :service_name, :singly_access_token
    def self.build(service_name, singly_access_token)
      o                          = self.new
      o.service_name             = service_name
      o.singly_access_token      = singly_access_token  
      o
    end
    
    def success?
      !!singly_access_token
    end
  end
end