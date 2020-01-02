require_relative "./passenger.rb"


class Flight
    attr_reader :passengers
    def initialize(flight_number,cap)
        @flight_number = flight_number
        @capacity = cap
        @passengers = []
    end

    def full?
        return true if @passengers.length == @capacity
        false
    end

    def board_passenger(pass_info)
        @passengers << pass_info if !self.full? && pass_info.has_flight?(@flight_number)
    end

    def list_passengers
        new_array = []

        @passengers.each do |ele|
            new_array << ele.name
        end

        new_array
    end

    def [](i)
        @passengers[i]
    end

    def <<(pass_info)
        self.board_passenger(pass_info)
    end
end