class Passenger
    attr_reader :name 
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight)
        return true if @flight_numbers.include?(flight.upcase) 
        false
    end

    def add_flight(str_flight)
        if !self.has_flight?(str_flight)
            @flight_numbers << str_flight.upcase
        end
    end

end