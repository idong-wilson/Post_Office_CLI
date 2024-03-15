class Package
    attr_accessor :tracking_number, :destination, :status
  
    def initialize(tracking_number, destination)
      @tracking_number = tracking_number
      @destination = destination
      @status = "In transit"
    end
  
    def update_status(new_status)
      @status = new_status
    end
  end