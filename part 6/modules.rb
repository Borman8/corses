module CompanyName

  def add_manufacturer(company_name)
    @company_name = company_name
  end
  
end

module InstanceCounter

  module ClassMethods
    attr_accessor :instances

    def instances
      @instances ||= 0
    end
    
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
