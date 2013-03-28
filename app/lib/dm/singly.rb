module DM
  class Singly
    attr_accessor :service_name, :signly_access_token
    def self.build(service_name, signly_access_token)
      o                          = self.new
      o.service_name             = service_name
      o.signly_access_token      = signly_access_token  
      o
    end
    
    def success?
      !!signly_access_token
    end
  end
end